//
//  UITextView+Utility.m
//  InstaRide
//
//  Created by iOS Developer on 25/03/16.
//  Copyright © 2016 Xperts Infosoft. All rights reserved.
//

#import "UITextView+Utility.h"

@implementation UITextView (Utility)

- (void)addToolbarWithTarget:(id)target DoneSelector:(SEL)doneSelector
{
    //done button
    UIButton *btnDone = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [btnDone setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnDone addTarget:target action:doneSelector forControlEvents:UIControlEventTouchUpInside];
    btnDone.tag = self.tag;
    
    //toolbar with items
    int screenWidth = [[UIScreen mainScreen]bounds].size.width;
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc]initWithCustomView:btnDone];
    UIBarButtonItem *itemFlexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolbar.items = @[itemFlexible, itemDone];
    
    self.inputAccessoryView = toolbar;
}

@end
