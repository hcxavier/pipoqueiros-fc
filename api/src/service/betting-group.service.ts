import generateCodeBettingGroup from "../helpers/generate-code-betting-group";
import { prisma } from "../lib/prisma";
import { addUserToBettingGroupParams, createBettingGroupParams } from "../types/betting-group-types";

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

    await prisma.groupParticipant.create({
        data: {
            userId: data.creatorId,
            bettingGroupId: BettingGroupCreated.id,
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

export async function addUserToBettingGroupService(data: addUserToBettingGroupParams) {
    const bettingGroup = await prisma.bettingGroup.findFirst({
        where: {
            OR: [{ id: data.bettingGroupId }, { code: data.bettingGroupId }],
        },
    });

    if (!bettingGroup) {
        throw new Error("Betting group not found");
    }

    const userAlreadyInBettingGroup = await prisma.groupParticipant.findFirst({
        where: {
            userId: data.userId,
            bettingGroupId: bettingGroup.id,
        },
    });

    if (userAlreadyInBettingGroup) {
        throw new Error("User already in betting group");
    }

    await prisma.groupParticipant.create({
        data: {
            userId: data.userId,
            bettingGroupId: bettingGroup.id,
        },
    });
}
