//
//  UIColor+OurColors.m
//  InstaRide
//
//  Created by iOS Developer on 03/12/15.
//  Copyright © 2015 Xperts Infosoft. All rights reserved.
//

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#import "UIColor+OurColors.h"

@implementation UIColor (OurColors)

+ (UIColor*)selectedSegmentColor
{
    return [UIColor colorWithWhite:0 alpha:0.3];
}

+ (UIColor*)appOrangeColor
{
    return RGB(228, 109, 10);
}

+ (UIColor*)appBlueColor
{
    return RGB(9, 68, 147);
}

+ (UIColor*)borderGreyColor
{
    return RGB(217, 217, 217);
}

@end
