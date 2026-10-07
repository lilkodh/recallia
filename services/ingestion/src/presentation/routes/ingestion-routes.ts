import { FastifyInstance } from "fastify";
import { RegisterIngestionItem } from "../../application/use-cases/register-ingestion-item";
import { ingestionHandler } from "../handlers/ingestion-handler";

export function registerIngestionRoutes(
  app: FastifyInstance,
  useCase: RegisterIngestionItem,
) {
  app.post("/ingestion/items", ingestionHandler(useCase));
}
