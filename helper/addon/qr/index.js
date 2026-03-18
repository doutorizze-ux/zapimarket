const fs = require("fs");
const path = require("path");
const pino = require("pino");
const { toDataURL } = require("qrcode");
const { query } = require("../../../database/dbpromise");

const { sendToUid } = require("../../../socket");

const sessions = new Map();

function getStorageConfig() {
  return {
    method: "file",
    mongoUri: "not set",
    mysqlHost: "localhost",
  };
}

async function createSession(id, title) {
  try {
    // Cleanup any old active listeners first to avoid memory leaks or duplicate updates on loop
    const previous = sessions.get(id);
    if (previous && previous.ev) {
      try {
         console.log(`Closing previous duplicate session listener for ${id}`);
         previous.ev.removeAllListeners();
      } catch (e) {}
    }

    sessions.set(id, { isInitializing: true });
    
    const authFolder = path.join(__dirname, "auth_info_baileys", id);
    const { makeWASocket, useMultiFileAuthState, DisconnectReason, fetchLatestBaileysVersion } = await import("baileys");
    
    let version = [2, 2413, 1]; // reasonable fallback
    try {
      const { version: latestVersion } = await fetchLatestBaileysVersion();
      if (latestVersion) version = latestVersion;
      console.log(`Using latest WhatsApp version for ${id}: ${version.join(".")}`);
    } catch (e) {
      console.log("Failed to fetch latest WA version, using fallback");
    }

    const { state, saveCreds } = await useMultiFileAuthState(authFolder);

    const sock = makeWASocket({
      auth: state,
      logger: pino({ level: "silent" }),
      version,
      browser: ["Chrome (Linux)", "Chrome", "110.0.5481.177"]
    });

    sessions.set(id, sock);

    sock.ev.on("creds.update", saveCreds);

    sock.ev.on("connection.update", async (update) => {
      const { connection, lastDisconnect, qr } = update;
      
      try {
        const [instance] = await query("SELECT * FROM instance WHERE uniqueId = ?", [id]);
        if (!instance) return;

        if (qr) {
          console.log("QR Generated for", id);
          const qrBase64 = await toDataURL(qr);
          await query("UPDATE instance SET qr = ?, data = ?, status = ? WHERE uniqueId = ?", [qrBase64, qrBase64, "GENERATING", id]);
          try {
            sendToUid(instance.uid, { type: "qr", qr: qrBase64 }, "qr");
            sendToUid(instance.uid, { uniqueId: id, qr: qrBase64 }, "update_instance");
          } catch(e) {}
        }

        if (connection === "close") {
          const reason = lastDisconnect?.error?.output?.statusCode;
          console.log(`Connection CLOSED for ${id}. Reason: ${reason}. full error:`, lastDisconnect?.error);
          const shouldReconnect = reason !== DisconnectReason.loggedOut;
          if (shouldReconnect) {
            console.log(`Reconnecting session ${id} in 5 seconds...`);
            setTimeout(() => {
              createSession(id, title);
            }, 5000);
          } else {
            console.log(`Session ${id} logged out or permanent fail.`);
            sessions.delete(id);
            const authFolder = path.join(__dirname, "auth_info_baileys", id);
            try {
              if (fs.existsSync(authFolder)) {
                fs.rmSync(authFolder, { recursive: true, force: true });
                console.log(`Deleted corrupt auth folder for ${id}`);
              }
            } catch (e) {
              console.error("Failed to delete auth info folder", e);
            }
            await query("UPDATE instance SET status = ? WHERE uniqueId = ?", ["INACTIVE", id]);
          }
        } else if (connection === "open") {
          console.log(`Connection OPEN for ${id}`);
          await query("UPDATE instance SET status = ?, number = ? WHERE uniqueId = ?", ["ACTIVE", sock.user.id.split(":")[0], id]);
        }
      } catch (err) {
        console.error(err);
      }
    });

    sock.ev.on("messages.upsert", async (m) => {
      try {
        if (!m.messages || !m.messages.length) return;
        const msg = m.messages[0];

        // Ignore Status/Stories updates to save bandwidth and keep inbox clean
        if (msg.key?.remoteJid === "status@broadcast") return;
        
        // Pass to inbox.js to trigger Socket and Chatbot Automations
        const { processMessage } = require("../../inbox/inbox");
        const [instance] = await query("SELECT * FROM instance WHERE uniqueId = ?", [id]);
        if (instance) {
           processMessage({
             body: msg,
             uid: instance.uid,
             origin: "qr",
             getSession: async () => sock,
             sessionId: id,
             qrType: "qr"
           }).catch(e => console.error("Error in processMessage trigger:", e));
        }
      } catch(e) {}
    });

    return sock;
  } catch (error) {
    console.error("Error creating session", error);
    return null;
  }
}

const getSession = (id) => sessions.get(id);

const getSessionByPhoneNumber = (number) => {
  for (const [id, sock] of sessions.entries()) {
    if (sock && sock.user && sock.user.id) {
       const userNumber = sock.user.id.split(":")[0];
       if (userNumber === number) {
          return { id, sock };
       }
    }
  }
  return null;
};

const deleteSession = async (id) => {
  const sock = sessions.get(id);
  if (sock) {
    try { await sock.logout(); } catch(e) {}
    sessions.delete(id);
  }
  const fs = require("fs");
  const authFolder = path.join(__dirname, "auth_info_baileys", id);
  if (fs.existsSync(authFolder)) {
    fs.rmSync(authFolder, { recursive: true, force: true });
  }
};

const isExists = async (session, jid, isGroup) => {
  if (isGroup) return true; // simplified
  try {
    const [result] = await session.onWhatsApp(jid);
    return result?.exists;
  } catch(e) {
    return false;
  }
};

const sendMessage = async (session, jid, content) => {
  if (!session) return Promise.reject("No session");
  return session.sendMessage(jid, content);
};

const formatPhone = (phone) => {
  if (phone.endsWith("@s.whatsapp.net")) return phone;
  let formatted = phone.replace(/\D/g, "");
  return formatted + "@s.whatsapp.net";
};

const formatGroup = (group) => {
  if (group.endsWith("@g.us")) return group;
  let formatted = group.replace(/[^\d-]/g, "");
  return formatted + "@g.us";
};

const cleanup = async () => {};
const init = async () => {
   // Reconnect active sessions
   try {
     const instances = await query("SELECT * FROM instance", []);
     for(let i of instances) {
        if(i.status === "ACTIVE" || i.status === "GENERATING" || i.status === "QR") {
           createSession(i.uniqueId, i.title);
        }
     }
   } catch(e) {}
};

const getGroupData = async () => Promise.reject(null);
const checkQr = () => true;

function downloadMediaMessage() {}
function getUrlInfo() {}
function generateProfilePicture() {}

module.exports = {
  isSessionExists: () => true,
  createSession,
  getSession,
  deleteSession,
  isExists,
  sendMessage,
  formatPhone,
  formatGroup,
  cleanup,
  init,
  getGroupData,
  getUrlInfo,
  downloadMediaMessage,
  checkQr,
  generateProfilePicture,
  getStorageConfig,
  getSessionByPhoneNumber
};
