//
//  GameCell.h
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface GameCell : UITableViewCell

- (void)showGame:(GameModel*)game;

@end
