const { checkTelePlugin } = require("../helper/addon/telegram/tele.js");

function returnAddons() {
  return ["WEBHOOK", "AI_BOT", "QR", "WACALL", "EMBED", "TELEGRAM"];
}

module.exports = { returnAddons };
