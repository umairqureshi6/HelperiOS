//
//  NSDate+CL.h
//
//  Created by Umair Qureshi on 10/12/2014.
//  Copyright (c) 2014 Umair Qureshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CL)
-(NSDate *)addDays:(NSInteger)day;
-(NSDate *)getWeekStartDate: (NSInteger)weekStartIndex;
-(NSString *)getDayOfWeekShortString;
-(NSString *)getDateOfMonth;
-(BOOL) isSameDateWith: (NSDate *)dt;
- (BOOL)isDateToday;
- (BOOL)isWithinDate: (NSDate *)earlierDate toDate:(NSDate *)laterDate;
- (BOOL)isPastDate;
@end
