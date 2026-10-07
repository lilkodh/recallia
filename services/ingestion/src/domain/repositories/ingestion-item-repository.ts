import { IngestionItem } from "../entities/ingestion-item";
// "I need something capable of saving an IngestionItem."
export interface IngestionItemRepository {
  save(ingestionItem: IngestionItem): Promise<void>;
}
