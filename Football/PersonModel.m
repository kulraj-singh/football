//
//  PersonModel.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (id)init
{
    self = [super init];
    if (self) {
        self.key = @"";
        self.name = @"";
    }
    return self;
}

- (id)initWithResponse:(NSDictionary *)response
{
    self = [super initWithResponse:response];
    if (self) {
        self.key = [self checkNil:[response objectForKey:kKey]];
        self.name = [self checkNil:[response objectForKey:kName]];
    }
    return self;
}

@end
