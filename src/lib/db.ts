// db.ts
import { Pool } from 'pg';

const pool = new Pool({
  connectionString: process.env.DATABASE_URL, // Ensure you have this in your .env file
});

export const query = async (text: string, params?: any[]) => {
  const res = await pool.query(text, params);
  return res;
};