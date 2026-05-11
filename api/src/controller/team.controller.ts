import { FastifyReply, FastifyRequest } from "fastify";
import { createTeamService } from "../service/team.service";
import { CreateTeamBody } from "../types/team-types";

export async function createTeam(request: FastifyRequest, reply: FastifyReply) {
    const data = request.body as CreateTeamBody;

    if (!data.name || !data.abbreviated_name || !data.shield_url) {
        return reply.status(400).send({ error: "Missing required fields: name, abbreviated_name, shield_url" });
    }

    try {
        const team = await createTeamService(data);
        return reply.status(201).send(team);
    } catch (error) {
        console.error(error);
        return reply.status(500).send({ error: "Failed to create team" });
    }
}
