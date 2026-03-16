const fs = require("fs");
const path = require("path");
const pino = require("pino");
const { toDataURL } = require("qrcode");
const { query } = require("../../../database/dbpromise");
const { makeWASocket, useMultiFileAuthState, DisconnectReason } = require("baileys");
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
    const authFolder = path.join(__dirname, "auth_info_baileys", id);
    const { state, saveCreds } = await useMultiFileAuthState(authFolder);

    const sock = makeWASocket({
      auth: state,
      printQRInTerminal: true,
      logger: pino({ level: "silent" })
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
          await query("UPDATE instance SET data = ?, status = ? WHERE uniqueId = ?", [qrBase64, "QR", id]);
          try {
            sendToUid(instance.uid, { type: "qr", qr: qrBase64 }, "qr");
            sendToUid(instance.uid, { uniqueId: id, qr: qrBase64 }, "update_instance");
          } catch(e) {}
        }

        if (connection === "close") {
          const shouldReconnect = lastDisconnect.error?.output?.statusCode !== DisconnectReason.loggedOut;
          if (shouldReconnect) {
            createSession(id, title);
          } else {
            sessions.delete(id);
            await query("UPDATE instance SET status = ? WHERE uniqueId = ?", ["INACTIVE", id]);
          }
        } else if (connection === "open") {
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
        
        // Pass to processThings.js
        const { processMessageQr } = require("./processThings");
        const [instance] = await query("SELECT * FROM instance WHERE uniqueId = ?", [id]);
        if (instance) {
          const [userData] = await query("SELECT * FROM user WHERE uid = ?", [instance.uid]);
          if(userData) {
             processMessageQr({
               type: "qr",
               message: msg,
               sessionId: id,
               getSession: async () => sock,
               userData,
               uid: instance.uid
             });
          }
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
  getStorageConfig
};
