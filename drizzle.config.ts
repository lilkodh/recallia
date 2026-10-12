import "dotenv/config";
import { defineConfig } from "drizzle-kit";
export default defineConfig({
  dialect: "postgresql",
  schema: "./services/ingestion/src/infrastructure/database/schema/ingestion-items.ts",
   out: "./infrastructure/postgres/migrations",
   dbCredentials: {
  url: process.env.DATABASE_URL!,
},
});
