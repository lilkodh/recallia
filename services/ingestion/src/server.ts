import "dotenv/config"
import { app } from "./app";


const start = async () => {
  try {
    await app.listen({ port: 3001 , host: '0.0.0.0'});
  } catch (err) {
    console.log(err);
  }
};

start();
