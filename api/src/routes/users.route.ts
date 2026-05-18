import { FastifyInstance } from "fastify";
import { userFindById } from "../controller/user.controller";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import z from "zod";

export async function usersRoute(app: FastifyInstance) {
    const publicServer = app.withTypeProvider<ZodTypeProvider>();

    publicServer.route({
        method: "GET",
        url: "/users/:id",
        schema: {
            tags: ["Users"],
            description: "Buscar usuário pelo ID",
            params: z.object({
                id: z.string(),
            }),
        },
        handler: userFindById,
    });
}
