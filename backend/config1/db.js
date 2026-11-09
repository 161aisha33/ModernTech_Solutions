import mysql from 'mysql2/promise';
import { config } from 'dotenv';

// Load environment variables from .env file
config();

// Create a connection pool
export const pool = mysql.createPool({
    database: process.env.DB_NAME,   
    port: process.env.DB_PORT,        
    user: process.env.DB_USER,        
    password: process.env.DB_PASSWORD, 
    host: process.env.DB_HOST,
    // Most hosted MySQL providers require SSL. Set DB_SSL=true in production.
    // Aiven uses its own CA: paste its ca.pem into DB_CA_CERT to verify the
    // server certificate; without it the connection is encrypted but unverified.
    ssl: process.env.DB_SSL === 'true'
        ? (process.env.DB_CA_CERT
            ? { ca: process.env.DB_CA_CERT.replace(/\\n/g, '\n') }
            : { rejectUnauthorized: false })
        : undefined
});



