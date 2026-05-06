import Fastify from "fastify";
import { usersRoute } from "./routes/users.route";

const app = Fastify();

app.get("/", async () => {
    return { message: "API rodando 🚀" };
});

app.register(usersRoute);

app.listen({ port: 3333 , host: '0.0.0.0' }).then(() => {
    console.log("Server running on http://localhost:3333");
});
