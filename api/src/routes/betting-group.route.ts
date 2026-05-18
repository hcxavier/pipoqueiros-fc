import { FastifyInstance } from "fastify";
import {
    addUserToBettingGroupController,
    createBettingGroupController,
    findBettingGroupByCodeController,
    getBettingGroupRankingController,
    getBettingGroupParticipantsController,
} from "../controller/betting-group.controller";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import { createBettingGroupSchema, addUserToBettingGroupSchema } from "../types/betting-group-types";
import z from "zod";

export async function bettingGroupRoute(app: FastifyInstance) {
    const publicServer = app.withTypeProvider<ZodTypeProvider>();

    publicServer.route({
        method: "POST",
        url: "/betting-groups",
        schema: {
            tags: ["Betting Groups"],
            description: "Criar um novo bolão",
            body: createBettingGroupSchema,
        },
        handler: createBettingGroupController,
    });

    publicServer.route({
        method: "GET",
        url: "/betting-groups/:code",
        schema: {
            tags: ["Betting Groups"],
            description: "Buscar bolão pelo código",
            params: z.object({
                code: z.string(),
            }),
        },
        handler: findBettingGroupByCodeController,
    });

    publicServer.route({
        method: "POST",
        url: "/betting-groups/add-user",
        schema: {
            tags: ["Betting Groups"],
            description: "Adicionar usuário em um bolão",
            body: addUserToBettingGroupSchema,
        },
        handler: addUserToBettingGroupController,
    });

    publicServer.route({
        method: "GET",
        url: "/betting-groups/:idOrCode/ranking",
        schema: {
            tags: ["Betting Groups"],
            description: "Buscar ranking de um bolão",
            params: z.object({
                idOrCode: z.string(),
            }),
        },
        handler: getBettingGroupRankingController,
    });

    publicServer.route({
        method: "GET",
        url: "/betting-groups/:idOrCode/participants",
        schema: {
            tags: ["Betting Groups"],
            description: "Buscar participantes de um bolão",
            params: z.object({
                idOrCode: z.string(),
            }),
        },
        handler: getBettingGroupParticipantsController,
    });
}
