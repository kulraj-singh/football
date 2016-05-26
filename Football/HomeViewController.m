//
//  HomeViewController.m
//  Football
//
//  Created by iOS Developer on 25/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#define pages @[@"Games", @"Persons", @"Rounds", @"Teams"]

enum {
    SECTION_GAMES,
    SECTION_PERSONS,
    SECTION_ROUNDS,
    SECTION_TEAMS
};

#import "HomeViewController.h"
#import "GamesViewController.h"
#import "GoalsViewController.h"
#import "PersonsViewController.h"
#import "RoundsViewController.h"
#import "TeamsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Sections";
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

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return pages.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = pages[indexPath.row];
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case SECTION_GAMES:
        {
            GamesViewController *gamesVc = [[GamesViewController alloc]initWithNibName:@"GamesViewController" bundle:nil];
            [self.navigationController pushViewController:gamesVc animated:YES];
            break;
        }
            
        case SECTION_PERSONS:
        {
            PersonsViewController *peopleVc = [[PersonsViewController alloc]initWithNibName:@"PersonsViewController" bundle:nil];
            [self.navigationController pushViewController:peopleVc animated:YES];
            break;
        }
            
        case SECTION_ROUNDS:
        {
            RoundsViewController *roundsVc = [[RoundsViewController alloc]initWithNibName:@"RoundsViewController" bundle:nil];
            [self.navigationController pushViewController:roundsVc animated:YES];
            break;
        }
            
        case SECTION_TEAMS:
        {
            TeamsViewController *teamVc = [[TeamsViewController alloc]initWithNibName:@"TeamsViewController" bundle:nil];
            [self.navigationController pushViewController:teamVc animated:YES];
            break;
        }
            
        default:
            break;
    }
}


@end
