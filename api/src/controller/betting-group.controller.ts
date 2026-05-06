import { FastifyReply, FastifyRequest } from "fastify";
import { createBettingGroupParams } from "../types/betting-group-types";
import { createBettingGroupService, findBettingGroupByCodeService } from "../service/betting-group.service";

export async function createBettingGroupController(request: FastifyRequest, reply: FastifyReply) {
    const { name, creatorId } = request.body as createBettingGroupParams;

    if (!name || !creatorId) {
        return reply.status(400).send({ error: "Name and Creator ID are required" });
    }

    try {
        const bettingGroup = await createBettingGroupService({ name, creatorId });
        return reply.status(201).send(bettingGroup);
    } catch (error) {
        console.error("Error creating betting group:", error);
        return reply.status(500).send({ error: "An error occurred while creating the betting group" });
    }
}

export async function findBettingGroupByCodeController(request: FastifyRequest, reply: FastifyReply) {
    const { code } = request.params as { code: string };

    if (!code) {
        return reply.status(400).send({ error: "Code is required" });
    }

    try {
        const bettingGroup = await findBettingGroupByCodeService(code);

        if (!bettingGroup) {
            return reply.status(404).send({ error: "Betting group not found" });
        }

        return reply.status(200).send(bettingGroup);
    } catch (error) {
        console.error("Error finding betting group by code:", error);
        return reply.status(500).send({ error: "An error occurred while finding the betting group" });
    }
}
