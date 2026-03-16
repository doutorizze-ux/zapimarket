require('dotenv').config();
const mysql = require('mysql2/promise');
const bcrypt = require('bcrypt');

async function resetPassword() {
    try {
        const connection = await mysql.createConnection({
            host: process.env.DBHOST,
            user: process.env.DBUSER,
            password: process.env.DBPASS,
            database: process.env.DBNAME,
            port: process.env.DBPORT || 3306
        });

        const newPass = '123456';
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(newPass, salt);

        await connection.query('UPDATE admin SET password = ? WHERE id = 1', [hash]);
        
        console.log('==============================================');
        console.log('✅ SENHA RESETADA COM SUCESSO! ✅');
        
        const [rows] = await connection.query('SELECT email FROM admin');
        console.log('==============================================');
        console.log('Use uma das contas abaixo para fazer login:');
        rows.forEach(r => {
            console.log(`E-mail: ${r.email}`);
            console.log(`Senha:  ${newPass}`);
            console.log('-------------------------');
        });
        console.log('==============================================');
        
        process.exit(0);
    } catch(err) {
        console.error('❌ Erro inesperado:', err.message);
        process.exit(1);
    }
}

resetPassword();
