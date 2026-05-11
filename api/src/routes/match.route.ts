import { FastifyInstance } from "fastify";
import { createMatch } from "../controller/match.controller";

export async function matchRoute(app: FastifyInstance) {
    app.post("/matches", createMatch);
}
