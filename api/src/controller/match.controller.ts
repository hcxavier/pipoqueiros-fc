import { FastifyReply, FastifyRequest } from "fastify";
import { createMatchService } from "../service/match.service";
import { CreateMatchBody } from "../types/match-types";

export async function createMatch(request: FastifyRequest, reply: FastifyReply) {
    const data = request.body as CreateMatchBody;

    if (!data.round || !data.home_team_id || !data.away_team_id || !data.match_date) {
        return reply.status(400).send({ error: "Missing required fields" });
    }

    try {
        const match = await createMatchService(data);
        return reply.status(201).send(match);
    } catch (error) {
        console.error(error);
        return reply.status(500).send({ error: "Failed to create match" });
    }
}
