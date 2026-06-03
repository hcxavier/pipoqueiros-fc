import { FastifyReply, FastifyRequest } from "fastify";
import { ErrorResponse, SuccessResponse } from "../types/api-response";
import { AppError } from "../errors/app-error";
import { getRankingByStateService, GetRankingGeneralService } from "../service/ranking.service";

export async function getRankingGeneralController(request: FastifyRequest, reply: FastifyReply) {
    try {
        const ranking = await GetRankingGeneralService();
        return reply.status(200).send(new SuccessResponse(200, "Ranking geral obtido com sucesso", ranking));
    } catch (error) {
        console.error("Error getting general ranking:", error);
        if (error instanceof AppError) {
            return reply.status(error.statusCode).send(new ErrorResponse(error.statusCode, error.message));
        }

        return reply.status(500).send(new ErrorResponse(500, "Ocorreu um erro ao obter o ranking geral"));
    }
}

export async function getRankingByStateController(request: FastifyRequest, reply: FastifyReply) {
    try {
        const { state } = request.params as { state: string };
        if (state.length !== 2 || state === null || state === undefined) {
            return reply.status(400).send(new ErrorResponse(400, "O estado deve ser representado por 2 caracteres"));
        }

        const ranking = await getRankingByStateService(state);
        return reply
            .status(200)
            .send(new SuccessResponse(200, `Ranking por estado (${state}) obtido com sucesso`, ranking));
    } catch (error) {
        console.error("Error getting ranking by state:", error);
        if (error instanceof AppError) {
            return reply.status(error.statusCode).send(new ErrorResponse(error.statusCode, error.message));
        }

        return reply.status(500).send(new ErrorResponse(500, "Ocorreu um erro ao obter o ranking por estado"));
    }
}
