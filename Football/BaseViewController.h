//
//  BaseViewController.h
//  Football
//
//  Created by iOS Developer on 25/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface BaseViewController : UIViewController<AFConnectionDelegate, UITableViewDelegate, UITableViewDataSource> {
    AppDelegate *_appDelegate;
    AFConnectionManager *_requestManager;
}

- (void)showServiceFailAlertWithMessage:(NSString *)message tag:(NSInteger)tag;
- (void)showLoaderWithTitle:(NSString *)title;
- (void)hideLoader;
- (void)alertController:(UIAlertController *)alertController clickedButtonAtIndex:(NSInteger)buttonIndex tag:(NSInteger)tag;

@end
