import {z} from "zod";

export const ingestionItemSchema = z.object({
  deviceId: z.uuid(),
  sourceType: z.enum(["photo", "video", "document", "audio", "screenshot"]),
  externalId: z.string().min(1),
  sourcePath: z.string().min(1),
  occurredAt: z.coerce.date(),
});
