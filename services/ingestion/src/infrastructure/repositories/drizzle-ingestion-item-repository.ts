import { IngestionItem } from "../../domain/entities/ingestion-item";
import { IngestionItemRepository } from "../../domain/repositories/ingestion-item-repository";
import { db } from "../database/connection";
import { ingestionItems } from "../database/schema/ingestion-items";

// this is a implemantent part that say {"I know HOW to fulfill that contract using Drizzle and PostgreSQL."}
export class DrizzleIngestionRepository implements IngestionItemRepository {
  async save(ingestionItem: IngestionItem): Promise<void> {
    await db.insert(ingestionItems).values({
      id: ingestionItem.id,
      deviceId: ingestionItem.deviceId,
      sourceType: ingestionItem.sourceType,
      externalId: ingestionItem.externalId,
      sourcePath: ingestionItem.sourcePath,
      occurredAt: ingestionItem.occurredAt,
      status: ingestionItem.status,
      createdAt: ingestionItem.createdAt,
    });
  }
}
