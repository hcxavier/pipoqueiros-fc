import { MatchStatus } from "../../generated/prisma/enums";
import { prisma } from "../lib/prisma";
import { CreateMatchBody, UpdateMatchStatusBody, FinishMatchBody } from "../types/match-types";
import { getActiveRoundService } from "./system.service";

export async function createMatchService(data: CreateMatchBody) {
    const match = await prisma.match.create({
        data: {
            round: data.round,
            home_team_id: data.home_team_id,
            away_team_id: data.away_team_id,
            match_date: new Date(data.match_date),
        },
    });

    return match;
}

export async function updateMatchStatusService(id: string, data: UpdateMatchStatusBody) {
    const match = await prisma.match.update({
        where: { id },
        data: {
            status: data.status as MatchStatus,
        },
    });

    return match;
}

export async function finishMatchService(id: string, data: FinishMatchBody) {
    const existingMatch = await prisma.match.findUnique({
        where: { id },
    });

    if (!existingMatch) {
        throw new Error("Match not found");
    }

    if (existingMatch.status === MatchStatus.FINISHED) {
        throw new Error("Match already finished");
    }

    const match = await prisma.match.update({
        where: { id },
        data: {
            home_score: data.home_score,
            away_score: data.away_score,
            status: MatchStatus.FINISHED,
        },
        include: {
            predictions: true,
        },
    });

    const actualResult =
        data.home_score > data.away_score ? "HOME_WIN" : data.home_score < data.away_score ? "AWAY_WIN" : "DRAW";

    // Distribuir a pontuação
    for (const prediction of match.predictions) {
        let points = 0;

        if (prediction.type === "EXACT_SCORE") {
            if (prediction.home_score_guess === data.home_score && prediction.away_score_guess === data.away_score) {
                points = 5;
            }
        } else if (prediction.type === "MATCH_RESULT") {
            if (prediction.result_guess === actualResult) {
                points = 3;
            }
        }

        if (points > 0) {
            await prisma.predication.update({
                where: { id: prediction.id },
                data: { points_earned: points },
            });

            await prisma.groupParticipant.updateMany({
                where: { userId: prediction.userId },
                data: {
                    score: { increment: points },
                },
            });
        }
    }

    return match;
}

export async function getCurrentRoundMatchesService() {
    const activeRound = await getActiveRoundService();

    const matches = await prisma.match.findMany({
        where: {
            round: activeRound,
        },
        include: {
            home_team: true,
            away_team: true,
        },
        orderBy: {
            match_date: 'asc',
        },
    });

    return {
        round: activeRound,
        matches,
    };
}
