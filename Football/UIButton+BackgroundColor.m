//
//  UIButton+BackgroundColor.m
//  Paytm
//
//  Created by iOS Developer on 30/07/15.
//  Copyright (c) 2015 Xperts Infosoft. All rights reserved.
//

#import "UIButton+BackgroundColor.h"
#import "UIImage+ImageManipulations.h"

@implementation UIButton (BackgroundColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    UIImage *backgroundImage = [UIImage imageWithColor:backgroundColor boundingRect:self.bounds];
    [self setBackgroundImage:backgroundImage forState:state];
}

@end
