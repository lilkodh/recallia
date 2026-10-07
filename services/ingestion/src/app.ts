import fastify from "fastify";
import { registerIngestionRoutes } from "./presentation/routes/ingestion-routes";
import { DrizzleIngestionRepository } from "./infrastructure/repositories/drizzle-ingestion-item-repository";
import { RegisterIngestionItem } from "./application/use-cases/register-ingestion-item";
const Ingestrepository = new DrizzleIngestionRepository();
const useCase = new RegisterIngestionItem(Ingestrepository);
export const app = fastify({
  logger: true,
});

registerIngestionRoutes(app, useCase);
