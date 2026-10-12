import { ingestionItemSchema } from "../schemas/ingestion-item-schema";
import { RegisterIngestionItem } from "../../application/use-cases/register-ingestion-item";
import { FastifyRequest, FastifyReply } from "fastify";
import { ZodError } from "zod";

export const ingestionHandler = (useCase: RegisterIngestionItem) => {
  return async (request: FastifyRequest, reply: FastifyReply) => {
    try {
      const input = ingestionItemSchema.parse(request.body);
      const result = await useCase.execute(input);

      if (!result.created) {
        return reply.status(200).send({
          success: true,
          message: "Ingestion item already exists",
        });
      }

      return reply.status(201).send({
        success: true,
        ingestionItem: result.ingestionItem,
        message: "Ingestion item created successfully",
      });
    } catch (err) {
      if (err instanceof ZodError) {
        return reply.status(400).send({
          success: false,
          error: err.issues[0],
        });
      }
      return reply.status(500).send({
        success: false,
        message: "Internal server error",
      });
    }
  };
};
