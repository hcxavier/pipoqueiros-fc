import { FastifyInstance } from "fastify";
import { createTeam } from "../controller/team.controller";

export async function teamRoute(app: FastifyInstance) {
    app.post("/teams", createTeam);
}
