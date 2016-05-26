//
//  BaseModel.m
//  foundation
//
//  Created by iOS Developer on 30/10/15.
//  Copyright © 2015 Xperts Infosoft. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)init
{
    self = [super init];
    if (self) {
        self.Id = @"";
        self.createdAt = @"";
        self.updatedAt = @"";
    }
    return self;
}

- (id)initWithResponse:(NSDictionary *)response
{
    self = [super init];
    if (self && [response isKindOfClass:[NSMutableDictionary class]]) {
        self.Id = [self checkNil:[response objectForKey:kId]];
        self.createdAt = [self checkNil:[response objectForKey:kCreatedAt]];
        self.updatedAt = [self checkNil:[response objectForKey:kUpdatedAt]];
    }
    return self;
}

- (NSString*)checkNil:(NSString *)string
{
    if (string) {
        return [NSString stringWithFormat:@"%@", string];
    } else {
        return @"";
    }
}

@end
