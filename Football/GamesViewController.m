//
//  GamesViewController.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "GamesViewController.h"
#import "GameCell.h"

@interface GamesViewController () {
    NSMutableArray *_games;
}

@property (weak, nonatomic) IBOutlet UITableView *tblGames;

@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Games";
    [self getGames];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getGames
{
    NSDictionary *headers = @{@"X-Mashape-Key": @"QsLM4k6pD5msh1yDmcKAfXilBo3sp1mJSMdjsn9lh4ZUP0HvtD", @"accepts": @"json", @"Accept": @"application/json"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://montanaflynn-fifa-world-cup.p.mashape.com/games"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self hideLoader];
            if (error) {
                NSLog(@"%@", error);
            } else {
                NSData *rawBody = response.rawBody;
                NSError *err;
                NSArray *games = [NSJSONSerialization JSONObjectWithData:rawBody options:NSJSONReadingAllowFragments error:&err];
                if (err) {
                    [AlertController alertWithMessage:err.localizedDescription presentingViewController:self];
                } else {
                    _games = [[NSMutableArray alloc]init];
                    for (NSDictionary *gameDict in games) {
                        GameModel *game = [[GameModel alloc]initWithResponse:gameDict];
                        [_games addObject:game];
                    }
                    [_tblGames reloadData];
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
    return _games.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    GameCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = (GameCell*)[[[NSBundle mainBundle]loadNibNamed:@"GameCell" owner:self options:nil]lastObject];
    }
    GameModel *game = _games[indexPath.row];
    [cell showGame:game];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
