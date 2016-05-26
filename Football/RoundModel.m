//
//  RoundModel.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "RoundModel.h"

@implementation RoundModel

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.knockout = @"";
    }
    return self;
}

- (id)initWithResponse:(NSDictionary *)response
{
    self = [super initWithResponse:response];
    if (self && [response isKindOfClass:[NSMutableDictionary class]]) {
        self.title = [self checkNil:[response objectForKey:kTitle]];
        self.knockout = [self checkNil:[response objectForKey:kKnockout]];
    }
    return self;
}

@end
