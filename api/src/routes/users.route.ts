import { FastifyInstance } from "fastify";
import { getAddressUser, userFindById } from "../controller/user.controller";
import { getUserBettingGroupsController } from "../controller/betting-group.controller";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import z from "zod";
import { authMiddleware } from "../lib/auth-middleware";
import { errorResponseSchema } from "../types/api-response";

export async function usersRoute(app: FastifyInstance) {
    const publicServer = app.withTypeProvider<ZodTypeProvider>();

    publicServer.route({
        method: "POST",
        url: "/register/address",
        schema: {
            tags: ["Users"],
            description: "BUscar cidade e estado pela latitude e longitude",
            body: z.object({
                latitude: z.string(),
                longitude: z.string(),
            }),
            response: {
                200: z.object({
                    code: z.number(),
                    message: z.string(),
                    data: z.object({
                        city: z.string(),
                        state: z.string(),
                    }),
                }),
                400: errorResponseSchema,
                404: errorResponseSchema,
                500: errorResponseSchema,
            },
        },

        handler: getAddressUser,
    });

    publicServer.route({
        method: "GET",
        url: "/users/:id",
        preHandler: [authMiddleware],
        schema: {
            tags: ["Users"],
            description: "[🔒 Autenticado] Buscar usuário pelo ID",
            params: z.object({
                id: z.string(),
            }),
            security: [{ bearerAuth: [] }],
        },
        handler: userFindById,
    });

    publicServer.route({
        method: "GET",
        url: "/users/:id/betting-groups",
        preHandler: [authMiddleware],
        schema: {
            tags: ["Users"],
            description: "[🔒 Autenticado] Buscar bolões de um usuário específico",
            params: z.object({
                id: z.string(),
            }),
            security: [{ bearerAuth: [] }],
            response: {
                200: z.object({
                    code: z.number(),
                    message: z.string(),
                    data: z.array(
                        z.object({
                            id: z.number(),
                            name: z.string(),
                            code: z.string(),
                            createdAt: z.date(),
                            creator: z.object({
                                id: z.string(),
                                name: z.string(),
                                image: z.string().nullable(),
                            }),
                            participants: z.array(
                                z.object({
                                    score: z.number(),
                                    user: z.object({
                                        id: z.string(),
                                        name: z.string(),
                                        image: z.string().nullable(),
                                    }),
                                })
                            ),
                        })
                    ),
                }),
                400: errorResponseSchema,
                404: errorResponseSchema,
                500: errorResponseSchema,
            },
        },
        handler: getUserBettingGroupsController,
    });
}

