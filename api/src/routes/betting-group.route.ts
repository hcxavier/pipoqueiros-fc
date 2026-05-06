import { FastifyInstance } from "fastify";
import { createBettingGroupController, findBettingGroupByCodeController } from "../controller/betting-group.controller";

export async function bettingGroupRoute(app: FastifyInstance) {
    app.post("/betting-groups", createBettingGroupController);
    app.get("/betting-groups/:code", findBettingGroupByCodeController);
}
