import { FastifyInstance } from "fastify";
import { createTeam, getAllTeams } from "../controller/team.controller";

export async function teamRoute(app: FastifyInstance) {
    app.get("/teams", getAllTeams);
    app.post("/teams", createTeam);
}
