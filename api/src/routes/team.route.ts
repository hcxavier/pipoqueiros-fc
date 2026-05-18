import { FastifyInstance } from "fastify";
import { createTeam, getAllTeams } from "../controller/team.controller";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import z from "zod";
import { CreateTeamSchema } from "../types/team-types";

export async function teamRoute(app: FastifyInstance) {
    const publicServer = app.withTypeProvider<ZodTypeProvider>();

    publicServer.route({
        method: "GET",
        url: "/teams",
        schema: {
            tags: ["Teams"],
            description: "Buscar todos os times",
        },
        handler: getAllTeams,
    });

    publicServer.route({
        method: "POST",
        url: "/teams",
        schema: {
            tags: ["Teams"],
            description: "Criar um novo time",
            body: CreateTeamSchema,
        },
        handler: createTeam,
    });
}
