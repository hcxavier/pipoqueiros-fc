import z from "zod";

export interface CreateMatchBody {
    round: number;
    home_team_id: string;
    away_team_id: string;
    match_date: string; // ISO date string
}

export const CreateMatchSchema = z.object({
    round: z.number(),
    home_team_id: z.string(),
    away_team_id: z.string(),
    match_date: z.string(),
});

export interface UpdateMatchStatusBody {
    status: "SCHEDULED" | "IN_PROGRESS" | "FINISHED";
}

export const UpdateMatchStatusSchema = z.object({
    status: z.enum(["SCHEDULED", "IN_PROGRESS", "FINISHED"]),
});

export interface FinishMatchBody {
    home_score: number;
    away_score: number;
}

export const FinishMatchSchema = z.object({
    home_score: z.number(),
    away_score: z.number(),
});
