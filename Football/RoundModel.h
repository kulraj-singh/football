//
//  RoundModel.h
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#define kKnockout @"knockout"

#import "BaseModel.h"

@interface RoundModel : BaseModel

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *knockout;

@end
