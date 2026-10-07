import { app } from "./app";

const start = async () => {
  try {
    await app.listen({ port: 3001 });
  } catch (err) {
    console.log(err);
  }
};

start();
