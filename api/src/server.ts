import Fastify from "fastify";
import { usersRoute } from "./routes/users.route";
import { bettingGroupRoute } from "./routes/betting-group.route";
import { predicationRoute } from "./routes/predication.route";
import { matchRoute } from "./routes/match.route";
import { teamRoute } from "./routes/team.route";
import { systemRoute } from "./routes/system.route";
import { toNodeHandler } from "better-auth/node";
import { auth } from "./lib/auth";
import cors from "@fastify/cors";

const app = Fastify({
    logger: true,
});

app.register(cors, {
    origin: "*",
    credentials: true,
});

app.get("/", async () => {
    return { message: "API rodando 🚀" };
});

app.all("/api/auth/*", async (request, reply) => {
    // 1. Reconstruímos a URL completa da requisição
    const url = `${request.protocol}://${request.headers.host}${request.url}`;

    // 2. Como o Fastify já consumiu o stream e gerou o request.body,
    // nós o transformamos de volta em string JSON.
    const hasBody = ["POST", "PUT", "PATCH"].includes(request.method);
    const body = hasBody && request.body ? JSON.stringify(request.body) : null;

    // 3. Montamos a requisição no padrão Web que o Better Auth entende perfeitamente
    const req = new Request(url, {
        method: request.method,
        // O TypeScript pode pedir um cast aqui dependendo da sua versão
        headers: request.headers as HeadersInit,
        body,
    });

    // 4. Chamamos o handler nativo (auth.handler) em vez do toNodeHandler
    const response = await auth.handler(req);

    // 5. Repassamos o código de status e todos os headers (essencial para CORS e tokens)
    reply.status(response.status);
    response.headers.forEach((value, key) => {
        reply.header(key, value);
    });

    // 6. Retornamos o corpo da resposta
    const responseBody = await response.text();
    return reply.send(responseBody);
});

app.register(usersRoute);
app.register(bettingGroupRoute);
app.register(predicationRoute);
app.register(matchRoute);
app.register(teamRoute);
app.register(systemRoute);

app.listen({ port: 3333, host: "0.0.0.0" }).then(() => {
    console.log("Server running on http://localhost:3333");
});
