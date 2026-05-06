import { FastifyInstance } from "fastify";
import { userFindById } from "../controller/user.controller";

export async function usersRoute(app: FastifyInstance) {
    app.get("/users/:id", userFindById);
}
