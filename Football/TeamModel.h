//
//  TeamModel.h
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#define kCode @"code"

#import "BaseModel.h"

@interface TeamModel : BaseModel

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *code;

@end
