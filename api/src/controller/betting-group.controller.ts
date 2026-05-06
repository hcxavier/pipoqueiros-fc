import { FastifyReply, FastifyRequest } from "fastify";
import { addUserToBettingGroupParams, createBettingGroupParams } from "../types/betting-group-types";
import {
    addUserToBettingGroupService,
    createBettingGroupService,
    findBettingGroupByCodeService,
} from "../service/betting-group.service";

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

export async function addUserToBettingGroupController(request: FastifyRequest, reply: FastifyReply) {
    const { userId, bettingGroupId } = request.body as addUserToBettingGroupParams;

    if (!userId || !bettingGroupId) {
        return reply.status(400).send({ error: "User ID and Betting Group ID are required" });
    }

    try {
        await addUserToBettingGroupService({ userId, bettingGroupId });
        return reply.status(200).send({ message: "User added to betting group successfully" });
    } catch (error: any) {
        console.error("Error adding user to betting group:", error);
        if (error.message === "User already in betting group") {
            return reply.status(409).send({ error: error.message });
        }
        if (error.message === "Betting group not found") {
            return reply.status(404).send({ error: error.message });
        }
        return reply.status(500).send({ error: "An error occurred while adding the user to the betting group" });
    }
}
