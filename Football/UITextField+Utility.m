//
//  UITextField+Utility.m
//  sharetime
//
//  Created by iOS Developer on 23/09/15.
//  Copyright © 2015 Xperts Infosoft. All rights reserved.
//

#import "UITextField+Utility.h"

@implementation UITextField (Utility)

- (void)addLeftImageNamed:(NSString *)imgName
{
    if (self.leftView) {
        for (UIView *subview in self.leftView.subviews) {
            [subview removeFromSuperview];
        }
    }
    UIImage *image = [UIImage imageNamed:imgName];
    int height = self.frame.size.height;
    
    //create a view and add image view to it
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, height, height)];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, height/2, height)];
    imgView.center = CGPointMake(height/2, height/2);
    imgView.image = image;
    imgView.backgroundColor = [UIColor whiteColor];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [paddingView addSubview:imgView];
    
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)addRightImageWithImageName:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    int height = self.frame.size.height;
    
    //create a view and add image view to it
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, height, height)];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, height/2, height)];
    imgView.center = CGPointMake(height/2, height/2);
    imgView.image = image;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [paddingView addSubview:imgView];
    
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)addRightText:(NSString*)text
{
    [self addRightText:text mode:UITextFieldViewModeAlways];
}

- (void)addRightText:(NSString *)text mode:(UITextFieldViewMode)mode
{
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, self.frame.size.height)];
    lbl.text = text;
    NSString *fontName = self.font.familyName;
    [lbl sizeToFit];
    CGFloat fontSize = self.font.pointSize * 0.7;
    lbl.font = [UIFont fontWithName:fontName size:fontSize];
    
    self.rightView = lbl;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)addRightButtonWithImageName:(NSString *)imgName target:(id)target selector:(SEL)selector
{
    UIImage *image = [UIImage imageNamed:imgName];
    int height = self.frame.size.height;
    
    //create a view and add image view to it
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, height, height)];
    btn.center = CGPointMake(height/2, height/2);
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.tag = self.tag;
    
    self.rightView = btn;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)addLeftPadding:(CGFloat)padding
{
    int height = self.frame.size.height;
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, padding, height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)addRightPadding:(CGFloat)padding
{
    int height = self.frame.size.height;
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, padding, height)];
    self.rightView= paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

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

- (void)addToolbarWithTarget:(id)target DoneSelector:(SEL)doneSelector nextSelector:(SEL)nextSelector
{
    //done button
    UIButton *btnDone = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [btnDone setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnDone addTarget:target action:doneSelector forControlEvents:UIControlEventTouchUpInside];
    btnDone.tag = self.tag;
    
    //next button
    UIButton *btnNext = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [btnNext setTitle:@"Next" forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnNext addTarget:target action:nextSelector forControlEvents:UIControlEventTouchUpInside];
    btnNext.tag = self.tag;
    
    //toolbar with items
    int screenWidth = [[UIScreen mainScreen]bounds].size.width;
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 44)];
    
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc]initWithCustomView:btnDone];
    UIBarButtonItem *itemNext = [[UIBarButtonItem alloc]initWithCustomView:btnNext];
    UIBarButtonItem *itemFlexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolbar.items = @[itemNext, itemFlexible, itemDone];
    
    self.inputAccessoryView = toolbar;
}

- (void)showRequiredFieldStar
{
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, self.frame.size.height)];
    lbl.text = @"* ";
    lbl.textColor = [UIColor redColor];
    [lbl sizeToFit];
    
    self.rightView = lbl;
    self.rightViewMode = UITextFieldViewModeAlways;
}

@end
