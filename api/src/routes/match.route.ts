import { FastifyInstance } from "fastify";
import { createMatch, updateMatchStatus, finishMatch, getCurrentRoundMatches } from "../controller/match.controller";

export async function matchRoute(app: FastifyInstance) {
    app.get("/matches/current", getCurrentRoundMatches);
    app.post("/matches", createMatch);
    app.patch("/matches/:id/status", updateMatchStatus);
    app.post("/matches/:id/finish", finishMatch);
}
