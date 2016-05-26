//
//  NSString+Validations.h
//
//  Created by Kulraj Singh on 23/04/15.

//these are a few formats
//for your app or feature define your own format ok

//patterns
#define patternForCountryCode @"^[+]\\d{1,4}$"
#define patternForPrice @"^\\d+(\\.\\d{1,2})?$"
#define patternForInteger @"^\\d*$"
#define patternForZipCode @"^\\d{4,8}$"
#define patternForName @"^[A-z]*$"
#define patternForPlace @"^[A-z\\s]*$"
#define patternAlnum @"^[A-z\\d]*$"
#define patternForDate @"^dd/dd/dddd$"
#define patternForEmail @"^(\\w[.]?)*\\w+[@](\\w[.]?)*\\w+[.][a-z]{2,4}$"
#define patternForPhoneNumber @"^[0-9]{5,10}$"
#define patternForUsername @"^[A-z][^\\s]*$"
#define patternForHeight @"^\\d{1,4}(\\.\\d?)?$"

#import <Foundation/Foundation.h>

@interface NSString (Validations)

- (BOOL)isValidForPattern:(NSString*)pattern;
- (BOOL)isValidForPattern:(NSString *)pattern options:(int)options;

@end
