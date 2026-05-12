import { PredicationCreateInput } from "../../generated/prisma/models";

export interface createPredicationParams {
    userId: string;
    matchId: string;
    predicationType: PredicationCreateInput["type"];
    home_score_guess: number | null;
    away_score_guess: number | null;
    result_guess: PredicationCreateInput["result_guess"] | null;
}
