import { FastifyInstance } from "fastify";
import { createPredicationController } from "../controller/predication.controller";
import { ZodTypeProvider } from "fastify-type-provider-zod";
import { createPredicationSchema } from "../types/predication-types";

export async function predicationRoute(app: FastifyInstance) {
    const publicServer = app.withTypeProvider<ZodTypeProvider>();

    publicServer.route({
        method: "POST",
        url: "/predications",
        schema: {
            tags: ["Predications"],
            description: "Criar uma nova predição (palpite)",
            body: createPredicationSchema,
        },
        handler: createPredicationController,
    });

    // app.get("/predications/:id", findPredicationByIdController);
    // app.get("/predications", findAllPredicationsController);
    // app.put("/predications/:id", updatePredicationController);
    // app.delete("/predications/:id", deletePredicationController);
}
