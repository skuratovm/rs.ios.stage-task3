#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSArray *months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    if (monthNumber > 12 || monthNumber < 1)
        return nil;
    else
        return months[monthNumber - 1];
                
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
       dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
       return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    long dayNumber = [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:date];
        
    if ([[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:date]) {
            return [[dateFormatter shortWeekdaySymbols] objectAtIndex:dayNumber-1];
        }
    else
           return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *today = [NSDate now];
        NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
        
        NSDateComponents *weekComponents =[calender components:(NSCalendarUnitDay |
                                                   NSCalendarUnitWeekOfYear) fromDate:date];
        NSDateComponents *todayComponents =
                            [calender components:(NSCalendarUnitDay |
                                                   NSCalendarUnitWeekOfYear) fromDate:today];
        
        if (weekComponents.year == todayComponents.year &&
            weekComponents.weekOfYear == todayComponents.weekOfYear) return YES;
        else
        return NO;
}

@end
