//
//  BaseViewController.m
//  Football
//
//  Created by iOS Developer on 25/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#define RETRY 0

#import "BaseViewController.h"
#import "MBProgressHUD.h"

@interface BaseViewController () {
    MBProgressHUD *_loader;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    _requestManager = [[AFConnectionManager alloc]init];
    _requestManager.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - loader

- (void)showLoaderWithTitle:(NSString *)title
{
    if (!_loader) {
        _loader = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
}

- (void)hideLoader
{
    if (_loader) {
        [_loader removeFromSuperview];
        _loader = nil;
    }
}

#pragma mark - alert

- (void)showFirstAlert:(NSString*)message
{
    [AlertController showAlertWithTitle:nil message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@[@"OK"] style:UIAlertControllerStyleAlert presentingViewController:self tag:ALERT_NO_RESULTS];
}

- (void)showServiceFailAlertWithMessage:(NSString *)message tag:(NSInteger)tag
{
    [AlertController showAlertWithTitle:nil message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@[@"Retry"] style:UIAlertControllerStyleAlert presentingViewController:self tag:tag];
}

#pragma mark - alert view delegate

- (void)alertController:(UIAlertController *)alertController clickedButtonAtIndex:(NSInteger)buttonIndex tag:(NSInteger)tag
{
    if (tag == ALERT_NO_RESULTS) {
        [AlertController alertWithMessage:@"You could try changing one or more of your search parameters and try again" presentingViewController:self];
        return;
    }
    if (buttonIndex == RETRY && tag >= 200) {
        [self sendDataToServerWithTask:tag];
    }
}

#pragma mark - silence warning

- (void)sendDataToServerWithTask:(NSInteger)task
{
    
}

- (void)requestFailedWithError:(NSMutableDictionary *)errorDict
{
    
}

- (void)requestFinishedWithResponse:(id)response
{
    
}

@end
