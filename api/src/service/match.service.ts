import { prisma } from "../lib/prisma";
import { CreateMatchBody } from "../types/match-types";

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
