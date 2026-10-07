import {z} from "zod";

export const ingestionItemSchema = z.object({
  deviceId: z.string(),
  sourceType: z.enum(["photo", "video", "document", "audio", "screenshot"]),
  externalId: z.string(),
  sourcePath: z.string(),
  occurredAt: z.coerce.date(),
});
