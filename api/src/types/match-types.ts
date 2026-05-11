export interface CreateMatchBody {
    round: number;
    home_team_id: string;
    away_team_id: string;
    match_date: string; // ISO date string
}
