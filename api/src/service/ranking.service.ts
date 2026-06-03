import { prisma } from "../lib/prisma";

export async function GetRankingGeneralService() {
    const ranking = await prisma.$queryRaw`
        SELECT 
            u.id, 
            u.name, 
            u.image, 
            COALESCE(SUM(gp.score), 0)::int AS "totalScore"
        FROM users u
        LEFT JOIN group_participants gp ON u.id = gp."userId"
        GROUP BY u.id, u.name, u.image
        ORDER BY "totalScore" DESC
        LIMIT 50;
    `;

    return ranking;
}
