//
//  UITextField+Utility.h
//  sharetime
//
//  Created by iOS Developer on 23/09/15.
//  Copyright © 2015 Xperts Infosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Utility)

- (void)addLeftImageNamed:(NSString*)imgName;

- (void)addLeftPadding:(CGFloat)padding;

- (void)addRightPadding:(CGFloat)padding;

- (void)addRightButtonWithImageName:(NSString*)imgName target:(id)target selector:(SEL)selector;

- (void)addRightImageWithImageName:(NSString*)imgName;

- (void)addToolbarWithTarget:(id)target DoneSelector:(SEL)doneSelector;

- (void)addToolbarWithTarget:(id)target DoneSelector:(SEL)doneSelector nextSelector:(SEL)nextSelector;

- (void)addRightText:(NSString*)text;

- (void)showRequiredFieldStar;

- (void)addRightText:(NSString *)text mode:(UITextFieldViewMode)mode;

@end
