//
//  UINavigationController+Utility.m
//  Paytm
//
//  Created by iOS Developer on 23/07/15.
//  Copyright (c) 2015 Xperts Infosoft. All rights reserved.
//

#import "Header.h"

@implementation UINavigationController (Utility)

+ (void)setBackgroundColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, screenSize.width, 44);
    UIImage *bgImage = [UIImage imageWithColor:color boundingRect:rect];
    [[UINavigationBar appearance] setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - bar buttons

- (void)addCustomLeftView
{
    int width = 30;
    UIImage *image = [UIImage imageNamed:@"arrow"];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, width, 44)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self.topViewController action:@selector(leftBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imgPic = [[UIImageView alloc]initWithFrame:CGRectMake(width, 0, 30, 30)];
    imgPic.image = [UIImage imageNamed:@"header_placeholder"];
    
    UIView *view = [[UIView alloc]init];
    [view addSubview:btn];
    [view addSubview:imgPic];
    [view sizeToFit];
    view.backgroundColor = [UIColor redColor];
    self.topViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
}

- (void)addLeftBarButtonNamed:(NSString *)name
{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self.topViewController action:@selector(leftBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.topViewController.navigationItem.leftBarButtonItem = item;
}

- (void)addLeftBarButtonWithImageNamed:(NSString *)imgName
{
    UIButton *btn = [self buttonWithImageNamed:imgName selector:@selector(leftBarButtonClicked:) width:30];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.topViewController.navigationItem.leftBarButtonItem = item;
}

- (void)addRightBarButtonWithImageNamed:(NSString *)imgName
{
    UIButton *btn = [self buttonWithImageNamed:imgName selector:@selector(rightBarButtonClicked:) width:50];
    self.topViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

- (UIButton*)buttonWithImageNamed:(NSString*)imgName selector:(SEL)selector width:(int)width
{
    UIImage *image = [UIImage imageNamed:imgName];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, width, 44)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self.topViewController action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - silence warnings

- (IBAction)leftBarButtonClicked:(id)sender
{
    
}

- (IBAction)rightBarButtonClicked:(id)sender
{
    
}

#pragma mark - center view

- (void)addTitle:(NSString *)title color:(UIColor *)color
{
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectZero];
    lblTitle.text = title;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.textColor = color;
    [lblTitle sizeToFit];
    lblTitle.adjustsFontSizeToFitWidth = YES;
    
    self.topViewController.navigationItem.titleView = lblTitle;
}

- (void)addTitle:(NSString *)title
{
    [self addTitle:title color:[UIColor whiteColor]];
}

- (void)addPlainTitle:(NSString *)title color:(UIColor *)color
{
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectZero];
    lblTitle.text = title;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.textColor = color;
    //lblTitle.font = [UIFont systemFontOfSize:30];
    [lblTitle sizeToFit];
    self.topViewController.navigationItem.titleView = lblTitle;
}

- (void)addEmptyViewToLeftBarButton
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[[UIView alloc]init]];
    self.topViewController.navigationItem.leftBarButtonItem = item;
}

- (void)addEmptyViewToRightBarButton
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)]];
    self.topViewController.navigationItem.rightBarButtonItem = item;
}

@end
