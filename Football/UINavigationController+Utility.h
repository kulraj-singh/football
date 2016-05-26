//
//  UINavigationController+Utility.h
//  Paytm
//
//  Created by iOS Developer on 23/07/15.
//  Copyright (c) 2015 Xperts Infosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Utility)

+ (void)setBackgroundColor:(UIColor*)color;
- (void)addLeftBarButtonNamed:(NSString *)name;
- (void)addLeftBarButtonWithImageNamed:(NSString*)imgName;
- (void)addRightBarButtonWithImageNamed:(NSString*)imgName;
- (void)addPlainTitle:(NSString*)title color:(UIColor*)color;
- (void)addTitle:(NSString*)title;
- (void)addTitle:(NSString *)title color:(UIColor*)color;
- (void)addEmptyViewToLeftBarButton;
- (void)addEmptyViewToRightBarButton;
- (void)addCustomLeftView;

@end
