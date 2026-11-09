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
    ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: true } : undefined
});



