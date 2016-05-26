//
//  TeamsViewController.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "TeamModel.h"
#import "TeamsViewController.h"

@interface TeamsViewController () {
    NSMutableArray *_teams;
}

@property (weak, nonatomic) IBOutlet UITableView *tblTeams;

@end

@implementation TeamsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Teams";
    [self getTeams];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getTeams
{
    NSDictionary *headers = @{@"X-Mashape-Key": @"QsLM4k6pD5msh1yDmcKAfXilBo3sp1mJSMdjsn9lh4ZUP0HvtD", @"accepts": @"json", @"Accept": @"application/json"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://montanaflynn-fifa-world-cup.p.mashape.com/teams"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self hideLoader];
            if (error) {
                NSLog(@"%@", error);
            } else {
                NSData *rawBody = response.rawBody;
                NSError *err;
                NSArray *teams = [NSJSONSerialization JSONObjectWithData:rawBody options:NSJSONReadingAllowFragments error:&err];
                if (err) {
                    [AlertController alertWithMessage:err.localizedDescription presentingViewController:self];
                } else {
                    _teams = [[NSMutableArray alloc]init];
                    for (NSDictionary *teamDict in teams) {
                        TeamModel *team = [[TeamModel alloc]initWithResponse:teamDict];
                        [_teams addObject:team];
                    }
                    [_tblTeams reloadData];
                }
            }
        });
    }];
    
    [self showLoaderWithTitle:@""];
    [asyncConnection start];
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _teams.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    TeamModel *team = _teams[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%@)", team.title, team.code];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
