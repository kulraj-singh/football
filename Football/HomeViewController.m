//
//  HomeViewController.m
//  Football
//
//  Created by iOS Developer on 25/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self sendDataToServerWithTask:TASK_GET_GAME];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - send data to server

- (void)sendDataToServerWithTask:(NSInteger)task
{
    [self showLoaderWithTitle:@""];
    
    switch (task) {
        case TASK_GET_GAME:
        {
            NSDictionary *headers = @{@"X-Mashape-Key": @"QsLM4k6pD5msh1yDmcKAfXilBo3sp1mJSMdjsn9lh4ZUP0HvtD", @"accepts": @"json", @"Accept": @"application/json"};
            UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
                [request setUrl:@"https://montanaflynn-fifa-world-cup.p.mashape.com/games"];
                [request setHeaders:headers];
            }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
                [self hideLoader];
                if (error) {
                    NSLog(@"%@", error);
                } else {
                    NSData *rawBody = response.rawBody;
                    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:rawBody options:NSJSONReadingAllowFragments error:nil];
                    NSLog(@"%@", responseDict);
                }
            }];
            
            
            [asyncConnection start];
            break;
        }
            
        default:
            break;
    }
}


@end
