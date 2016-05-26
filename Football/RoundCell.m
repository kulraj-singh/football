//
//  RoundCell.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "RoundCell.h"

@interface RoundCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblKnockoutOrLeague;

@end

@implementation RoundCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showRound:(RoundModel *)round
{
    _lblNumber.text = [NSString stringWithFormat:@"Match # %@", round.Id];
    _lblTitle.text = round.title;
    _lblKnockoutOrLeague.text = [round.knockout isEqualToString:@"t"] ? @"Knockout" : @"League Game";
}

@end
