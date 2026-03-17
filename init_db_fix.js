const { query } = require('./database/dbpromise');

async function checkAndCreateTables() {
  try {
    console.log("Checking for missing flow tables...");
    
    await query(`
      CREATE TABLE IF NOT EXISTS \`flow_templates\` (
        \`id\` int(11) NOT NULL AUTO_INCREMENT,
        \`title\` varchar(255) DEFAULT NULL,
        \`description\` text DEFAULT NULL,
        \`source\` text DEFAULT NULL,
        \`data\` longtext DEFAULT NULL,
        \`createdAt\` timestamp NOT NULL DEFAULT current_timestamp(),
        \`updatedAt\` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        PRIMARY KEY (\`id\`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    `);

    await query(`
      CREATE TABLE IF NOT EXISTS \`beta_flows\` (
        \`id\` int(11) NOT NULL AUTO_INCREMENT,
        \`uid\` varchar(255) DEFAULT NULL,
        \`flow_id\` varchar(255) DEFAULT NULL,
        \`source\` varchar(255) DEFAULT NULL,
        \`name\` varchar(255) DEFAULT NULL,
        \`data\` longtext DEFAULT NULL,
        \`createdAt\` timestamp NOT NULL DEFAULT current_timestamp(),
        \`updatedAt\` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        PRIMARY KEY (\`id\`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    `);

    console.log("✅ flow_templates and beta_flows tables verified/created.");
  } catch (err) {
    console.error("❌ Error guaranteeing flow tables:", err);
  }
}

module.exports = { checkAndCreateTables };
