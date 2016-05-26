//
//  BaseModel.h
//  foundation
//
//  Created by iOS Developer on 30/10/15.
//  Copyright © 2015 Xperts Infosoft. All rights reserved.
//

#define kId @"id"
#define kMessage @"message"
#define kStatus @"status"
#define kCountry @"country"
#define kCreatedAt @"created_at"
#define kUpdatedAt @"updated_at"
#define kImage @"image"
#define kUserId @"user_id"
#define kName @"name"
#define kKey @"key"
#define kTitle @"title"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseModel : NSObject

@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *createdAt;
@property (strong, nonatomic) NSString *updatedAt;

- (id)initWithResponse:(NSDictionary*)response;
- (NSString*)checkNil:(NSString*)string;

@end
