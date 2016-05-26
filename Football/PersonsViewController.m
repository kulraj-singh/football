//
//  PersonsViewController.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "PersonsViewController.h"
#import "PersonModel.h"
#import "NSString+Cleaning.h"

@interface PersonsViewController () {
    NSMutableArray *_people;
}

@property (weak, nonatomic) IBOutlet UITableView *tblPeople;

@end

@implementation PersonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"People";
    [self getPeopleList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getPeopleList
{
    NSDictionary *headers = @{@"X-Mashape-Key": @"QsLM4k6pD5msh1yDmcKAfXilBo3sp1mJSMdjsn9lh4ZUP0HvtD", @"accepts": @"json", @"Accept": @"application/json"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://montanaflynn-fifa-world-cup.p.mashape.com/persons"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self hideLoader];
            if (error) {
                NSLog(@"%@", error);
            } else {
                NSData *rawBody = response.rawBody;
                NSString *str = [[NSString alloc]initWithData:rawBody encoding:NSUTF8StringEncoding];
                str = [str stringByRemovingControlCharacters];
                rawBody = [str dataUsingEncoding:NSUTF8StringEncoding];
                NSError *err;
                NSArray *people = [NSJSONSerialization JSONObjectWithData:rawBody options:NSJSONReadingAllowFragments error:&err];
                if (err) {
                    [AlertController alertWithMessage:err.localizedDescription presentingViewController:self];
                } else {
                    _people = [[NSMutableArray alloc]init];
                    for (NSDictionary *personDict in people) {
                        PersonModel *person = [[PersonModel alloc]initWithResponse:personDict];
                        [_people addObject:person];
                    }
                    [_tblPeople reloadData];
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
    return _people.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    PersonModel *person = _people[indexPath.row];
    cell.textLabel.text = person.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
