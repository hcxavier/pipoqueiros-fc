import { FastifyReply, FastifyRequest } from "fastify";
import { createPredicationParams } from "../types/predication-types";
import { createPredicationService } from "../service/predication.service";
import { SuccessResponse, ErrorResponse } from "../types/api-response";

export async function createPredicationController(request: FastifyRequest, reply: FastifyReply) {
    const { userId, matchId, predicationType, home_score_guess, away_score_guess, result_guess, bettingGroupId } =
        request.body as createPredicationParams;

    if (!userId || !matchId || !predicationType || bettingGroupId === undefined) {
        return reply.status(400).send(new ErrorResponse(400, "User ID, Match ID, Predication Type, and Betting Group ID are required"));
    }

    try {
        const predication = await createPredicationService({
            userId,
            matchId,
            predicationType,
            home_score_guess,
            away_score_guess,
            result_guess,
            bettingGroupId,
        });
        return reply.status(201).send(new SuccessResponse(201, "Predication created successfully", predication));
    } catch (error) {
        console.error("Error creating predication:", error);
        return reply.status(500).send(new ErrorResponse(500, "An error occurred while creating the predication"));
    }
}
