import {
  pgTable,
  uuid,
  varchar,
  text,
  timestamp,
} from "drizzle-orm/pg-core";

export const ingestionItems = pgTable("ingestion_items",{
    id: uuid("id").primaryKey(),
    deviceId: uuid("device_id").notNull(),
    sourceType: varchar("source_type",{ length : 50}).notNull(),
    externalId: varchar("external_id", {length : 50}).notNull(),
    sourcePath: text("source_path").notNull(),
    occurredAt: timestamp("occurred_at").notNull(),
    status: varchar("status",{length: 30}).notNull(),
    createdAt: timestamp("created_at").notNull(),
});