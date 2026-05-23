import { FastifyReply, FastifyRequest } from "fastify";
import { getActiveRoundService, updateActiveRoundService } from "../service/system.service";
import { UpdateActiveRoundBody } from "../types/system-types";
import { SuccessResponse, ErrorResponse } from "../types/api-response";

export async function getActiveRound(request: FastifyRequest, reply: FastifyReply) {
    try {
        const round = await getActiveRoundService();
        return reply.status(200).send(new SuccessResponse(200, "Active round fetched successfully", { current_active_round: round }));
    } catch (error) {
        console.error(error);
        return reply.status(500).send(new ErrorResponse(500, "Failed to fetch active round"));
    }
}

export async function updateActiveRound(request: FastifyRequest, reply: FastifyReply) {
    const data = request.body as UpdateActiveRoundBody;

    if (data.round === undefined || typeof data.round !== 'number') {
        return reply.status(400).send(new ErrorResponse(400, "A valid round number is required"));
    }

    try {
        const settings = await updateActiveRoundService(data.round);
        return reply.status(200).send(new SuccessResponse(200, "Active round updated successfully", settings));
    } catch (error) {
        console.error(error);
        return reply.status(500).send(new ErrorResponse(500, "Failed to update active round"));
    }
}
