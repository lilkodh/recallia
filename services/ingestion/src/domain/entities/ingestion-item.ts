export class IngestionItem {
  id: string;
  deviceId: string;
  sourceType: "photo" | "video" | "document" | "audio" | "screenshot";
  externalId: string;
  sourcePath: string;
  occurredAt: Date;
  status : "pending" | "processing" | "processed" | "failed" ;
  createdAt: Date;

  constructor(
    id: string,
    deviceId: string,
    sourceType: "photo" | "video" | "document" | "audio" | "screenshot",
    externalId: string,
    sourcePath: string,
    occurredAt: Date,
    status : "pending" | "processing" | "processed" | "failed",
    createdAt: Date,
    
    
  ) {
      this.id = id,
      this.deviceId = deviceId,
      this.sourceType = sourceType,
      this.externalId = externalId,
      this.sourcePath = sourcePath,
      this.occurredAt = occurredAt;
      this.status = status ;
      this.createdAt = createdAt ;
  }
  MarkAsProcessing (){
    if(this.status === "pending"){
       
        this.status = "processing"
    }

  };
  MarkAsProcessed (){
    if(this.status === "processing"){
        this.status = "processed"
    }
  };
  MarkAsFailed() {
    if (this.status === "processing"){
        this.status = "failed"
    }
  };
  
}
