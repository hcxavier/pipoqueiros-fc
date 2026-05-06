export interface createBettingGroupParams {
    name: string;
    creatorId: string;
}

export interface addUserToBettingGroupParams {
    userId: string;
    bettingGroupId: string;
}
