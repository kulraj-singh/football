//
//  NSString+Cleaning.m
//  Football
//
//  Created by iOS Developer on 26/05/16.
//  Copyright © 2016 kulraj. All rights reserved.
//

#import "NSString+Cleaning.h"

@implementation NSString (Cleaning)

- (NSString *)stringByRemovingControlCharacters
{
    NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
    NSRange range = [self rangeOfCharacterFromSet:controlChars];
    if (range.location != NSNotFound) {
        NSMutableString *mutable = [NSMutableString stringWithString:self];
        while (range.location != NSNotFound) {
            [mutable deleteCharactersInRange:range];
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return self;
}

@end
