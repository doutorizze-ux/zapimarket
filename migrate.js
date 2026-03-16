require('dotenv').config();
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');

async function importDatabase() {
    try {
        console.log("Connecting to the database:", process.env.DBHOST);
        const connection = await mysql.createConnection({
            host: process.env.DBHOST,
            user: process.env.DBUSER,
            password: process.env.DBPASS,
            database: process.env.DBNAME,
            port: process.env.DBPORT || 3306,
            multipleStatements: true // This is crucial for running .sql files!
        });

        console.log("Connected successfully! Reading import.sql...");
        const sqlPath = path.join(__dirname, 'database', 'import.sql');
        const sqlQuery = fs.readFileSync(sqlPath, 'utf8');

        console.log("Executing SQL file... This might take a few seconds.");
        await connection.query(sqlQuery);
        
        console.log("✅ Database imported successfully!");
        process.exit(0);
    } catch (error) {
        console.error("❌ Error importing database:", error);
        process.exit(1);
    }
}

importDatabase();
