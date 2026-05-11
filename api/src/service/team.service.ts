import { prisma } from "../lib/prisma";
import { CreateTeamBody } from "../types/team-types";

export async function createTeamService(data: CreateTeamBody) {
    const team = await prisma.team.create({
        data: {
            name: data.name,
            abbreviated_name: data.abbreviated_name,
            shield_url: data.shield_url,
        },
    });

    return team;
}
