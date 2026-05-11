import { FastifyInstance } from "fastify";
import { createPredicationController } from "../controller/predication.controller";

export async function predicationRoute(app: FastifyInstance) {
    app.post("/predications", createPredicationController);
    // app.get("/predications/:id", findPredicationByIdController);
    // app.get("/predications", findAllPredicationsController);
    // app.put("/predications/:id", updatePredicationController);
    // app.delete("/predications/:id", deletePredicationController);
}
