//
//  GameCell.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "GameCell.h"

@interface GameCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTeam1;
@property (weak, nonatomic) IBOutlet UILabel *lblTeam2;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;

@end

@implementation GameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showGame:(GameModel *)game
{
    _lblTeam1.text = game.team1Id;
    _lblTeam2.text = game.team2Id;
    _lblScore.text = [NSString stringWithFormat:@"%@ - %@", game.score1, game.score2];
}

@end
