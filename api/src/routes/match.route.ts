import { FastifyInstance } from "fastify";
import { createMatch, updateMatchStatus, finishMatch, getCurrentRoundMatches } from "../controller/match.controller";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import z from "zod";
import { CreateMatchSchema, UpdateMatchStatusSchema, FinishMatchSchema } from "../types/match-types";

export async function matchRoute(app: FastifyInstance) {
    const publicServer = app.withTypeProvider<ZodTypeProvider>();

    publicServer.route({
        method: "GET",
        url: "/matches/current",
        schema: {
            tags: ["Matches"],
            description: "Buscar partidas da rodada atual",
        },
        handler: getCurrentRoundMatches,
    });

    publicServer.route({
        method: "POST",
        url: "/matches",
        schema: {
            tags: ["Matches"],
            description: "Criar uma nova partida",
            body: CreateMatchSchema,
        },
        handler: createMatch,
    });

    publicServer.route({
        method: "PATCH",
        url: "/matches/:id/status",
        schema: {
            tags: ["Matches"],
            description: "Atualizar status de uma partida",
            params: z.object({
                id: z.string(),
            }),
            body: UpdateMatchStatusSchema,
        },
        handler: updateMatchStatus,
    });

    publicServer.route({
        method: "POST",
        url: "/matches/:id/finish",
        schema: {
            tags: ["Matches"],
            description: "Finalizar uma partida",
            params: z.object({
                id: z.string(),
            }),
            body: FinishMatchSchema,
        },
        handler: finishMatch,
    });
}
