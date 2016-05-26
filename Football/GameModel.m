//
//  GameModel.m
//  Football
//
//  Created by iOS Developer on 25/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//



#import "GameModel.h"

@implementation GameModel

- (id)init
{
    self = [super init];
    if (self) {
        _cityId = @"";
        _groundId = @"";
        _groupId = @"";
        _home = @"";
        _key = @"";
        _knockout = @"";
        _nextGameId = @"";
        _playAt = @"";
        _playAtV2 = @"";
        _playAtV3 = @"";
        _position = @"";
        _postponed = @"";
        _prevGameId = @"";
        _roundId = @"";
        _score1 = @"";
        _score1ExtraTime = @"";
        _score1Penalty = @"";
        _score1I = @"";
        _score1Ii = @"";
        _score2 = @"";
        _score2ExtraTime = @"";
        _score2Penalty = @"";
        _score2I = @"";
        _score2Ii = @"";
        _team1Id = @"";
        _team2Id = @"";
        _winner = @"";
        _winner90 = @"";
    }
    return self;
}

- (id)initWithResponse:(NSDictionary *)response
{
    self = [super initWithResponse:response];
    if (self) {
        _cityId = [self checkNil:[response objectForKey:kCityId]];
        _groundId = [self checkNil:[response objectForKey:kGroundId]];
        _groupId = [self checkNil:[response objectForKey:kGroupId]];
        _home = [self checkNil:[response objectForKey:kHome]];
        _key = [self checkNil:[response objectForKey:kKey]];
        _knockout = [self checkNil:[response objectForKey:kKnockout]];
        _nextGameId = [self checkNil:[response objectForKey:kNextGameId]];
        _playAt = [self checkNil:[response objectForKey:kPlayAt]];
        _playAtV2 = [self checkNil:[response objectForKey:kPlayAt2]];
        _playAtV3 = [self checkNil:[response objectForKey:kPlayAt3]];
        _position = [self checkNil:[response objectForKey:kPos]];
        _postponed = [self checkNil:[response objectForKey:kPostponed]];
        _prevGameId = [self checkNil:[response objectForKey:kPrevGameId]];
        _roundId = [self checkNil:[response objectForKey:kRoundId]];
        _score1 = [self checkNil:[response objectForKey:kScore1]];
        _score1ExtraTime = [self checkNil:[response objectForKey:kScore1Et]];
        _score1Penalty = [self checkNil:[response objectForKey:kScore1p]];
        _score1I = [self checkNil:[response objectForKey:kScore1i]];
        _score1Ii = [self checkNil:[response objectForKey:kScore1Ii]];
        _score2 = [self checkNil:[response objectForKey:kScore2]];
        _score2ExtraTime = [self checkNil:[response objectForKey:kScore2Et]];
        _score2Penalty = [self checkNil:[response objectForKey:kScore2p]];
        _score2I = [self checkNil:[response objectForKey:kScore2i]];
        _score2Ii = [self checkNil:[response objectForKey:kScore2Ii]];
        _team1Id = [self checkNil:[response objectForKey:kTeam1Id]];
        _team2Id = [self checkNil:[response objectForKey:kTeam2Id]];
        _winner = [self checkNil:[response objectForKey:kWinner]];
        _winner90 = [self checkNil:[response objectForKey:kWinner90]];
    }
    return self;
}

@end
