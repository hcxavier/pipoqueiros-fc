import { FastifyInstance } from "fastify";
import { getActiveRound, updateActiveRound } from "../controller/system.controller";

export async function systemRoute(app: FastifyInstance) {
    app.get("/system/active-round", getActiveRound);
    app.patch("/system/active-round", updateActiveRound);
}
