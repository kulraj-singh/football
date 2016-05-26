//
//  AlertController.h
//  foundation
//
//  Created by iOS Developer on 30/10/15.
//  Copyright © 2015 Xperts Infosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum {
    ALERT_PASSWORD_UPDATED = 400,
    ALERT_PROFILE_UPDATED,
    ALERT_BUY_CREDITS,
    ALERT_DEDUCT_CREDITS,
    ALERT_CAMERA_SOURCE,
    ALERT_DELETE_RESULT,
    ALERT_NO_RESULTS,
    ALERT_RESUBMIT_JOURNEY_START,
    ALERT_RESUBMIT_THIRTY_MINUTES,
    ALERT_SELECT_DATE,
    ALERT_SUBMIT_INSTANT_OFFER,
    ALERT_SUBMIT_INSTANT_REQUEST,
    ALERT_RESUBMIT,
    ALERT_DELETE_ALL
};


@interface AlertController : NSObject

@property (strong, nonatomic) UIAlertController *uiAlertController;

+ (void)alertWithMessage:(NSString*)message presentingViewController:(UIViewController*)vc;
+ (void)alertWithMessage:(NSString *)message presentingViewController:(UIViewController *)vc tag:(NSInteger)tag;
+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate cancelButtonTitle:(NSString*)cancelTitle otherButtonTitles:(NSArray*)otherButtonTitles style:(UIAlertControllerStyle)style presentingViewController:(UIViewController*)vc tag:(NSInteger)tag;

//for showing text field
//first call init function
//then add text fields
//then present from your view view controller
- (id)initAlertWithTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate cancelButtonTitle:(NSString*)cancelTitle otherButtonTitles:(NSArray*)otherButtonTitles presentingViewController:(UIViewController*)vc tag:(NSInteger)tag;
- (void)addTextFieldWithPlaceholder:(NSString*)placeholder;
- (void)addTextFieldWithPlaceholder:(NSString *)placeholder secureEntry:(BOOL)secure;

@end

@protocol AlertControllerDelegate <NSObject>

@optional

- (void)alertController:(UIAlertController*)alertController clickedButtonAtIndex:(NSInteger)buttonIndex tag:(NSInteger)tag;
- (void)alertControllerDidCancel;

@end

@interface AlertController ()

@property (weak, nonatomic) id<AlertControllerDelegate> delegate;

@end
