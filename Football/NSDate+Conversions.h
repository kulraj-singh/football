//
//  NSDate+Conversions.h
//
//  Created by Kulraj Singh on 28/04/15.
//

//you can define your own format(s) and pass in the function call
//remember to use 'yyyy' and not 'YYYY'
#define formatForDateDisplay @"dd/MM/yyyy HH:mm"
#define formatDateOnly @"yyyy-MM-dd"
#define formatOtherServerDate @"dd-MM-yyyy"
#define formatTimeOnly @"HH:mm:ss"
#define formatForSlashDate @"dd/MM/yyyy"
#define formatServerDate @"yyyy-MM-dd HH:mm:ss"
#define formatForTimeStamp @"yyyy-MM-dd-HH:mm:ss"

#import <Foundation/Foundation.h>

@interface NSDate (Conversions)

+ (NSDate*)dateForString:(NSString*)string format:(NSString*)format;
- (NSString*)stringWithFormat:(NSString*)format;

//function to get the elapsed time from nsdate
//usually displayed in chat screens etc eg. 2mins ago, 4 hrs ago
- (NSString*)getShortTime;
- (NSDate*)cleanTimeFromDate;
+ (NSDate*)mondayForCurrentWeek;
- (NSDate*)mondayOfWeek;

@end
