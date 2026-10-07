CREATE TABLE "ingestion_items" (
	"id" uuid PRIMARY KEY NOT NULL,
	"device_id" uuid NOT NULL,
	"source_type" varchar(50) NOT NULL,
	"external_id" varchar(50) NOT NULL,
	"source_path" text NOT NULL,
	"occurred_at" timestamp NOT NULL,
	"status" varchar(30) NOT NULL,
	"created_at" timestamp NOT NULL
);
