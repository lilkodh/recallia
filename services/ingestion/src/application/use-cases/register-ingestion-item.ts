import { randomUUID } from "node:crypto";
import { IngestionItem } from "../../domain/entities/ingestion-item";
import { IngestionItemRepository } from "../../domain/repositories/ingestion-item-repository";
export interface RegisterIngestionItemInput {
  deviceId: string,
  sourceType: "photo" | "video" | "document" | "audio" | "screenshot",
  externalId: string,
  sourcePath: string,
  occurredAt: Date;
}
export class RegisterIngestionItem {
  constructor(private repository: IngestionItemRepository) {}
   async execute(input:RegisterIngestionItemInput ){
      
        const id = randomUUID();
        const createdAt = new Date();
         const ingestionItem = new IngestionItem(
            id,
            input.deviceId,
            input.sourceType,
            input.externalId,
            input.sourcePath,
            input.occurredAt,
            "pending",
            createdAt
            
        )
        
        await this.repository.save(ingestionItem);

         return ingestionItem;
        
    }

}