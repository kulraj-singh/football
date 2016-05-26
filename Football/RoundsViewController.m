//
//  RoundsViewController.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "RoundsViewController.h"
#import "RoundCell.h"

@interface RoundsViewController () {
    NSMutableArray *_rounds;
}

@property (weak, nonatomic) IBOutlet UITableView *tblRounds;

@end

@implementation RoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Rounds";
    [self getRounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getRounds
{
    NSDictionary *headers = @{@"X-Mashape-Key": @"QsLM4k6pD5msh1yDmcKAfXilBo3sp1mJSMdjsn9lh4ZUP0HvtD", @"accepts": @"json", @"Accept": @"application/json"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://montanaflynn-fifa-world-cup.p.mashape.com/rounds"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self hideLoader];
            if (error) {
                NSLog(@"%@", error);
            } else {
                NSData *rawBody = response.rawBody;
                NSError *err;
                NSArray *rounds = [NSJSONSerialization JSONObjectWithData:rawBody options:NSJSONReadingAllowFragments error:&err];
                if (err) {
                    [AlertController alertWithMessage:err.localizedDescription presentingViewController:self];
                } else {
                    _rounds = [[NSMutableArray alloc]init];
                    for (NSDictionary *roundDict in rounds) {
                        RoundModel *round = [[RoundModel alloc]initWithResponse:roundDict];
                        [_rounds addObject:round];
                    }
                    [_tblRounds reloadData];
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
    return _rounds.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    RoundCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = (RoundCell*)[[[NSBundle mainBundle]loadNibNamed:@"RoundCell" owner:self options:nil]lastObject];
    }
    RoundModel *round = _rounds[indexPath.row];
    [cell showRound:round];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
