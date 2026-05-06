import Fastify from "fastify";

const app = Fastify();

app.get("/", async () => {
    return { message: "API rodando 🚀" };
});

app.listen({ port: 3333 }).then(() => {
    console.log("Server running on http://localhost:3333");
});
