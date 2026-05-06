import generateCodeBettingGroup from "../helpers/generate-code-betting-group";
import { prisma } from "../lib/prisma";
import { createBettingGroupParams } from "../types/betting-group-types";

export async function createBettingGroupService(data: createBettingGroupParams) {
    const codeGenerated = generateCodeBettingGroup();

    const codeIsExists = await prisma.bettingGroup.findUnique({
        where: { code: codeGenerated },
        select: { id: true },
    });

    if (codeIsExists) {
        return createBettingGroupService(data);
    }

    const BettingGroupCreated = await prisma.bettingGroup.create({
        data: {
            ...data,
            code: codeGenerated,
        },
    });

    return BettingGroupCreated;
}

export async function findBettingGroupByCodeService(code: string) {
    const bettingGroup = await prisma.bettingGroup.findUnique({
        where: { code },
        select: {
            id: true,
            name: true,
            participants: {
                select: {
                    user: {
                        select: { name: true },
                    },
                },
            },
            creator: {
                select: { name: true },
            },
        },
    });

    return bettingGroup;
}
