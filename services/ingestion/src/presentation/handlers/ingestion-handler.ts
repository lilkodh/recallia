import { ingestionItemSchema } from "../schemas/ingestion-item-schema";
import { RegisterIngestionItem } from "../../application/use-cases/register-ingestion-item";
import { FastifyRequest, FastifyReply } from "fastify";
import { ZodError } from "zod";

export const ingestionHandler = (useCase: RegisterIngestionItem) => {
  return async (request: FastifyRequest, reply: FastifyReply) => {
    try {
      const input = ingestionItemSchema.parse(request.body);
      const ingestionItem = await useCase.execute(input);

      return reply.status(201).send({
        ingestionItem,
        message: "ingestionitem created successfully",
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
