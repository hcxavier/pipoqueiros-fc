import { FastifyReply, FastifyRequest } from "fastify";
import { ErrorResponse, SuccessResponse } from "../types/api-response";
import { AppError } from "../errors/app-error";
import { GetRankingGeneralService } from "../service/ranking.service";

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
