//
//  NSString+Validations.m
//
//  Created by Kulraj Singh on 23/04/15.
//

#import "NSString+Validations.h"

@implementation NSString (Validations)

- (BOOL)isValidForPattern:(NSString *)pattern options:(int)options
{
    NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *matches = [regEx matchesInString:self options:NSMatchingAnchored range:NSMakeRange(0, self.length)];
    return matches.count > 0;
}

- (BOOL)isValidForPattern:(NSString *)pattern
{
    return [self isValidForPattern:pattern options:NSRegularExpressionCaseInsensitive];
}

@end
