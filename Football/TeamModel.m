//
//  TeamModel.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "TeamModel.h"

@implementation TeamModel

- (id)init
{
    self = [super init];
    if (self) {
        self.code = @"";
        self.title = @"";
    }
    return self;
}

- (id)initWithResponse:(NSDictionary *)response
{
    self = [super initWithResponse:response];
    if (self && [response isKindOfClass:[NSMutableDictionary class]]) {
        self.code = [self checkNil:[response objectForKey:kCode]];
        self.title = [self checkNil:[response objectForKey:kTitle]];
    }
    return self;
}

@end
