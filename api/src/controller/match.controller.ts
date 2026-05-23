import { FastifyReply, FastifyRequest } from "fastify";
import { getCurrentRoundMatchesService } from "../service/match.service";
import { SuccessResponse, ErrorResponse } from "../types/api-response";

export async function getCurrentRoundMatches(request: FastifyRequest, reply: FastifyReply) {
    try {
        const result = await getCurrentRoundMatchesService();
        return reply.status(200).send(new SuccessResponse(200, "Current round matches fetched successfully", result));
    } catch (error) {
        console.error(error);
        return reply.status(500).send(new ErrorResponse(500, "Failed to fetch current round matches"));
    }
}
