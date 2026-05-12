import { FastifyInstance } from "fastify";
import {
    addUserToBettingGroupController,
    createBettingGroupController,
    findBettingGroupByCodeController,
    getBettingGroupRankingController,
    getBettingGroupParticipantsController,
} from "../controller/betting-group.controller";

export async function bettingGroupRoute(app: FastifyInstance) {
    app.post("/betting-groups", createBettingGroupController);
    app.get("/betting-groups/:code", findBettingGroupByCodeController);
    app.post("/betting-groups/add-user", addUserToBettingGroupController);
    app.get("/betting-groups/:idOrCode/ranking", getBettingGroupRankingController);
    app.get("/betting-groups/:idOrCode/participants", getBettingGroupParticipantsController);
}
