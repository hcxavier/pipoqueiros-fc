export interface CreateMatchBody {
    round: number;
    home_team_id: string;
    away_team_id: string;
    match_date: string; // ISO date string
}

export interface UpdateMatchStatusBody {
    status: 'SCHEDULED' | 'IN_PROGRESS' | 'FINISHED';
}

export interface FinishMatchBody {
    home_score: number;
    away_score: number;
}
