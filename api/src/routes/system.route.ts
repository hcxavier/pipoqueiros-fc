import { FastifyInstance } from "fastify";
import { getActiveRound, updateActiveRound } from "../controller/system.controller";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import z from "zod";
import { UpdateActiveRoundSchema } from "../types/system-types";

export async function systemRoute(app: FastifyInstance) {
    const publicServer = app.withTypeProvider<ZodTypeProvider>();

    publicServer.route({
        method: "GET",
        url: "/system/active-round",
        schema: {
            tags: ["System"],
            description: "Buscar a rodada ativa",
        },
        handler: getActiveRound,
    });

    publicServer.route({
        method: "PATCH",
        url: "/system/active-round",
        schema: {
            tags: ["System"],
            description: "Atualizar a rodada ativa",
            body: UpdateActiveRoundSchema,
        },
        handler: updateActiveRound,
    });
}
