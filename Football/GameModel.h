//
//  GameModel.h
//  Football
//
//  Created by iOS Developer on 25/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#define kCityId @"city_id"
#define kGroundId @"ground_id"
#define kGroupId @"group_id"
#define kHome @"home"
#define kKnockout @"knockout"
#define kNextGameId @"next_game_id"
#define kPlayAt @"play_at"
#define kPlayAt2 @"play_at_v2"
#define kPlayAt3 @"play_at_v3"
#define kPos @"pos"
#define kPostponed @"postponed"
#define kPrevGameId @"prev_game_id"
#define kRoundId @"round_id"
#define kScore1 @"score1"
#define kScore1Et @"score1et"
#define kScore1i @"score1i"
#define kScore1Ii @"score1ii"
#define kScore1p @"score1p"
#define kScore2 @"score2"
#define kScore2Et @"score2et"
#define kScore2i @"score2i"
#define kScore2Ii @"score2ii"
#define kScore2p @"score2p"
#define kTeam1Id @"team1_id"
#define kTeam2Id @"team2_id"
#define kWinner @"winner"
#define kWinner90 @"winner90"

#import "BaseModel.h"

@interface GameModel : BaseModel

@property (strong, nonatomic) NSString *cityId;
@property (strong, nonatomic) NSString *groundId;
@property (strong, nonatomic) NSString *groupId;
@property (strong, nonatomic) NSString *home;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *knockout;
@property (strong, nonatomic) NSString *nextGameId;
@property (strong, nonatomic) NSString *playAtV2;
@property (strong, nonatomic) NSString *playAt;
@property (strong, nonatomic) NSString *playAtV3;
@property (strong, nonatomic) NSString *position;
@property (strong, nonatomic) NSString *postponed;
@property (strong, nonatomic) NSString *prevGameId;
@property (strong, nonatomic) NSString *roundId;
@property (strong, nonatomic) NSString *score1;
@property (strong, nonatomic) NSString *score1ExtraTime;
@property (strong, nonatomic) NSString *score1I;
@property (strong, nonatomic) NSString *score1Ii;
@property (strong, nonatomic) NSString *score1Penalty;
@property (strong, nonatomic) NSString *score2;
@property (strong, nonatomic) NSString *score2ExtraTime;
@property (strong, nonatomic) NSString *score2I;
@property (strong, nonatomic) NSString *score2Ii;
@property (strong, nonatomic) NSString *score2Penalty;
@property (strong, nonatomic) NSString *team1Id;
@property (strong, nonatomic) NSString *team2Id;
@property (strong, nonatomic) NSString *winner;
@property (strong, nonatomic) NSString *winner90;

@end


