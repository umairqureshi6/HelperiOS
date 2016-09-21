//
//  Utility.m
//
//
//  Created by Umair Qureshi on 22/11/2013.
//  Copyright (c) 2013 Umair Qureshi. All rights reserved.
//

#import "Utility.h"
#import "Constants.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#import <Foundation/Foundation.h>

//#import "FMDBDataAccess.h"
//#import "ProductsHelper.h"

@implementation Utility
#pragma mark -
#pragma mark - Init And Shared Object

-(id) init{
    if((self = [super init])){
        
    }
    return self;
}

+ (Utility *)sharedObject
{
    static Utility *objUtility = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objUtility = [[Utility alloc] init];
    });
    return objUtility;
}

#pragma mark -
#pragma mark - Distance convertion methods

+(double)meterToKilometer:(double)meter
{
    double kilometer=meter/1000;
    return kilometer;
}
+(double)kilometerToMeter:(double)kilometer
{
    double meter=kilometer*1000;
    return meter;
}
+(double)meterToMiles:(double)meter
{
    double miles=meter * 0.00062137119;
    return miles;
}
+(double)milesToMeter:(double)miles
{
    double meter=miles/0.00062137119;
    return meter;
}
+(double)kilometerToMiles:(double)kilometer
{
    double miles=kilometer * 0.62137;
    return miles;
}
+(double)milesToKilometer:(double)miles
{
    double kilometer=miles/0.62137;
    return kilometer;
}

#pragma mark -
#pragma mark - String Utillity Functions

+(Boolean) hasText : (UITextField*)textfield
{
    Boolean value = false;
    if ([textfield hasText]) {
        value = true;
    }else{
        value = false;
    }
    return value;
}

/**
 *  Get Trimmed String
 *
 *  @param theString input string that contains extra spaces
 *
 *  @return trimmed string
 */
+(NSString*) trimString:(NSString *)theString
{
    NSString *theStringTrimmed = [theString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return theStringTrimmed;
}

/**
 *  Description Get Trim Text , by providing text field string
 *
 *  @param textfield enter textfield value, that contain extra spaces
 *
 *  @return Trimmed text
 */
+(NSString *) getTrimText:(UITextField *) textfield
{
    NSString *theStringTrimmed = [textfield.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return theStringTrimmed;
}

/**
 *  Remove null from a string
 *
 *  @param string input string that contains null value
 *
 *  @return string value after removing null
 */
+(NSString *) removeNull:(NSString *) string
{
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    NSRange range = [string rangeOfString:@"null"];
    if (range.length > 0 || string == nil) {
        string = @"";
    }
    string = [self trimString:string];
    return string;
}

#pragma mark -
#pragma mark - Directory Path Methods

+ (NSString *)applicationDocumentDirectoryString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+ (NSString *)applicationCacheDirectoryString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return cacheDirectory;
}

+ (NSURL *)applicationDocumentsDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

# pragma mark -
# pragma mark - Scale and Rotate according to Orientation

- (UIImage *)scaleAndRotateImage:(UIImage *)image
{
    int kMaxResolution = 640; // Or whatever
    
    CGImageRef imgRef = image.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = roundf(bounds.size.width / ratio);
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = roundf(bounds.size.height * ratio);
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            
            // landscape right
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            
            // landscape left
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            
            // Portrait Mode
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}

+(BOOL)isValidEmailAddress:(NSString *)email
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString:laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
    
}
+(BOOL)isvalidPassword:(NSString *)password
{
    if (password.length<8) {
        return NO;
    }
    NSRange upperCaseRange;
    NSCharacterSet *upperCaseSet = [NSCharacterSet uppercaseLetterCharacterSet];
    
    upperCaseRange = [password rangeOfCharacterFromSet: upperCaseSet];
    if (upperCaseRange.location == NSNotFound)
    {
        return NO;
    }
    if ([password rangeOfCharacterFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].location!=NSNotFound)
    {
        return NO;
    }
    if ([password rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location==NSNotFound) {
        return NO;
    }
    NSString *specialCharacters = @"!#€%&/()[]=?$§*'@";
    if ([password rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:specialCharacters]].location!=NSNotFound) {
        return NO;
    }
    return YES;
}

/**
 *  Match two password, for confirmation that they are same
 *
 *  @param pwd    Password
 *  @param cnfPwd Confirm Password
 *
 *  @return return false if password doesn't match
 */
+(BOOL)isPasswordMatch:(NSString *)pwd withConfirmPwd:(NSString *)cnfPwd {
    //asume pwd and cnfPwd has not whitespace
    if([pwd length]>0 && [cnfPwd length]>0){
        if([pwd isEqualToString:cnfPwd]){
            NSLog(@"Hurray! Password matches ");
            return TRUE;
        }else{
            NSLog(@"Oops! Password does not matches");
            return FALSE;
        }
    }else{
        NSLog(@"Password field can not be empty ");
        return FALSE;
    }
    return FALSE;
}



#pragma mark -
#pragma mark - Alert Helper

/* +(void)showAlertWithTitle:(NSString *)strTitle andMessage:(NSString *)strMsg
 {
 UIAlertView *alret=[[UIAlertView alloc]initWithTitle:strTitle message:strMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
 [alret show];
 } */

#pragma mark -
#pragma mark - datetime helper

/**
 *  Current date with date and time, format 2016-08-23 12:33:33
 *
 *  @return current date in string format
 */
+(NSString*) currentDateTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *string = [formatter stringFromDate:[NSDate date]];
    return string;
}
/**
 *  Current date time with time zone, format 2016-08-23 12:33:33 gmt+5
 *
 *  @return current date time in string with timezone
 */
+(NSString*) currentDateTimeWithTimeZone
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    NSString *string = [formatter stringFromDate:[NSDate date]];
    return string;
}
/**
 *  Current date only with format 2016-08-23
 *
 *  @return date in short format with string
 */
+(NSString*) currentDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *string = [formatter stringFromDate:[NSDate date]];
    return string;
}

/**
 *  Returns current date, with format specified in input
 *
 *  @param format - provide date format
 *
 *  @return string with date
 */
+(NSString*) currentDateWithFormat :(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSString *string = [formatter stringFromDate:[NSDate date]];
    return string;
}
/**
 *  get current date and time , provide time with Am / Pm
 *
 *  @param timeAmPm time in AM or PM to get current date time
 *
 *  @return return current date for which time is set
 */
+(NSDate*) currentDateWithTimeAmPm :(NSString*)timeAmPm
{
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    NSDateFormatter *timeOnlyFormatter = [[NSDateFormatter alloc] init];
    [timeOnlyFormatter setLocale:locale];
    [timeOnlyFormatter setDateFormat:@"hh:mm a"];
    [timeOnlyFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    
    NSDate *today = [Utility getDeviceCurrentDateWithTimeZone];
    
    NSDateComponents *todayComps = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:today];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:[timeOnlyFormatter dateFromString:timeAmPm]];
    
    [comps setDay: todayComps.day];
    [comps setMonth: todayComps.month];
    [comps setYear: todayComps.year];
    
    /* [comps setDay: todayComps.day];
     comps.month = todayComps.month;
     comps.year = todayComps.year; */
    NSDate *DateTime = [calendar dateFromComponents:comps];
    
    return DateTime ;
}

/**
 *  Return device current date and time with time in NSDate format
 *
 *  @return NSdate format
 */
+( NSDate*)getDeviceCurrentDateWithTimeZone
{
    NSDate* sourceDate = [NSDate date];
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:sourceDate];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:sourceDate];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    
    NSDate* deviceCurrentDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:sourceDate];
    return deviceCurrentDate;
}

+(NSString*)currentTimeWithAmPm
{
    
    NSString * currentTime;
    //Get current time
    NSDate* now = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [gregorian components:(NSCalendarUnitHour  | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:now];
    NSInteger hour = [dateComponents hour];
    NSString *am_OR_pm=@"AM";
    
    if (hour>12)
    {
        hour=hour%12;
        
        am_OR_pm = @"PM";
    }
    
    NSInteger minute = [dateComponents minute];
    //  NSInteger second = [dateComponents second];
    
    currentTime =[NSString stringWithFormat:@"%02ld:%02ld %@", (long)hour, (long)minute,am_OR_pm];
    /* NSLog(@"Current Time  %@",[NSString stringWithFormat:@"%02ld:%02ld %@", (long)hour, (long)minute,am_OR_pm]); */
    return currentTime;
}

/** Returns a new NSDate object with the time set to the indicated hour,
 * minute, and second.
 * @param hour The hour to use in the new date.
 * @param minute The number of minutes to use in the new date.
 * @param second The number of seconds to use in the new date.
 */
-(NSDate *) dateWithHour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components: NSCalendarUnitYear|
                                    NSCalendarUnitMonth|
                                    NSCalendarUnitDay
                                               fromDate:[NSDate date]];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    NSDate *newDate = [calendar dateFromComponents:components];
    return newDate;
}

/**
 *  Convert string to NSDate
 *
 *  @param dateString date in string format
 *
 *  @return NSDate format date after conversion
 */

+ (NSDate *)stringToDate:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString: dateString];
    NSLog(@"date in function %@",date);
    return date;
}
+ (NSString *)stringToLongDate:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString: dateString];
    //    NSLog(@"date ---%@",date);
    [dateFormatter setDateFormat:@"d MMMM"];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)stringToDate:(NSString *)dateString withFormate:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString: dateString];
    return date;
}

+ (NSString *)DateToString:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//2013-07-15:10:00:00
    NSString * strdate = [formatter stringFromDate:date];
    return strdate;
}

+(NSString *)DateToString:(NSDate *)date withFormate:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];//2013-07-15:10:00:00
    NSString * strdate = [formatter stringFromDate:date];
    return strdate;
}
+ (NSDate *)dateModifiedWithHours:(NSString *)hours
                          minutes:(NSString *)minutes
                        andPeriod:(NSString *)period
{
    NSDate *dateModified = NSDate.date;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitMinute fromDate:dateModified];
    
    [components setMinute:minutes.intValue];
    
    int hour = 0;
    
    if ([period.uppercaseString isEqualToString:@"AM"]) {
        
        if (hours.intValue == 12) {
            hour = 0;
        }
        else {
            hour = hours.intValue;
        }
    }
    else if ([period.uppercaseString isEqualToString:@"PM"]) {
        
        if (hours.intValue != 12) {
            hour = hours.intValue + 12;
        }
        else {
            hour = 12;
        }
    }
    [components setHour:hour];
    
    dateModified = [calendar dateFromComponents:components];
    
    return dateModified;
}

-(NSString *)DateToStringForScanQueue:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    NSString * strdate = [formatter stringFromDate:date];
    int dd=[[Utility trimString:strdate]intValue];
    NSString *format=@"";
    if (dd==1 || dd==21 || dd==31) {
        format=@"ddst MMMM yyyy, hh:mm:ss a";
    }
    else if (dd==2 || dd==22)
    {
        format=@"ddnd MMMM yyyy, hh:mm:ss a";
    }
    else if (dd==3)
    {
        format=@"ddrd MMMM yyyy, hh:mm:ss a";
    }
    else{
        format=@"ddth MMMM yyyy, hh:mm:ss a";
    }
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:format];
    strdate= [formatter2 stringFromDate:date];
    return strdate;
}

+(NSString *)DateToString:(NSDate *)date withFormateSufix:(NSString *)format{
    
    NSDateFormatter *prefixDateFormatter = [[NSDateFormatter alloc] init];
    [prefixDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [prefixDateFormatter setDateFormat:format];
    NSString * prefixDateString = [prefixDateFormatter stringFromDate:date];
    NSDateFormatter *monthDayFormatter = [[NSDateFormatter alloc] init];
    [monthDayFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [monthDayFormatter setDateFormat:@"d"];
    int date_day = [[monthDayFormatter stringFromDate:date] intValue];
    NSString *suffix_string = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";
    NSArray *suffixes = [suffix_string componentsSeparatedByString: @"|"];
    NSString *suffix = [suffixes objectAtIndex:date_day];
    
    prefixDateString = [prefixDateString stringByReplacingOccurrencesOfString:@"." withString:suffix];
    NSString *dateString =prefixDateString;
    
    return dateString;
}

/**
 *  Date Difference from date in String
 *
 *  @param date1 enter date 1 in string
 *  @param date2 enter date 2 in string
 *
 *  @return return no of days in int
 */
-(int)dateDiffrenceFromDateInString:(NSString *)date1 second:(NSString *)date2
{
    // Manage Date Formation same for both dates
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *startDate = [formatter dateFromString:date1];
    NSDate *endDate = [formatter dateFromString:date2];
    
    
    unsigned flags = NSCalendarUnitDay;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
    
    int dayDiff = (int)[difference day];
    
    return dayDiff;
}

-(int)dateDiffrenceFromDate:(NSDate *)startDate second:(NSDate *)endDate
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    
    unsigned flags = NSCalendarUnitDay;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
    
    int dayDiff = (int)[difference day];
    if (dayDiff<1) {
        int hourDiff=(int)[difference hour];
        if (hourDiff>12) {
            return 1;
        }
    }
    return dayDiff;
}


#pragma mark -
#pragma mark - Tableview Helper

-(void)setTableViewHeightWithNoLine:(UITableView *)tbl
{
    CGRect rectTbl=tbl.frame;
    if (rectTbl.size.height>tbl.contentSize.height) {
        rectTbl.size.height=tbl.contentSize.height;
        tbl.scrollEnabled=FALSE;
    }
    else{
        tbl.scrollEnabled=TRUE;
    }
    [tbl setFrame:rectTbl];
}

#pragma mark -
#pragma mark - BarButtonItem Helper

-(UIBarButtonItem *)setBackbarButtonWithName:(NSString *)strName
{
    return [[UIBarButtonItem alloc] initWithTitle:strName style:UIBarButtonItemStylePlain target:nil action:nil];
}
+ ( NSString * ) getImageNameFor: ( NSString * ) imageName
{
    NSArray *companents =  [imageName componentsSeparatedByString:@"."];
    
    NSInteger selLanguage = [[NSUserDefaults standardUserDefaults] integerForKey:LANGUAGE_SELECTION];
    NSString *resourceName = [companents objectAtIndex:0];
    
    NSString *modifiedName =  ( selLanguage == APP_LANG_ENGLISH ) ? [resourceName stringByAppendingString:@"-e.png"] :
    [resourceName stringByAppendingString:@"-a.png"];
    if ( [companents count] == 1 )
    {
        modifiedName =  ( selLanguage == APP_LANG_ENGLISH ) ? [resourceName stringByAppendingString:@"-e"] :
        [resourceName stringByAppendingString:@"-a"];
    }
    
    return modifiedName;
}
+(bool)isNetworkAvailable
{
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityRef address =
    SCNetworkReachabilityCreateWithName(NULL, "www.google.com" );
    Boolean success = SCNetworkReachabilityGetFlags(address, &flags);
    CFRelease(address);
    
    bool canReachOnExistingConnection =     success
    && !(flags & kSCNetworkReachabilityFlagsConnectionRequired)
    && (flags & kSCNetworkReachabilityFlagsReachable);
    
    //    if( canReachOnExistingConnection )
    //        //// NSLog(@"Network available");
    //    else
    //        //// NSLog(@"Network not available");
    
    return canReachOnExistingConnection;
}

+ ( NSDictionary * ) loadAppDictContentFrom : ( NSString * )plistFile
{
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistFile ofType:@"plist"]];
    
    NSArray *allKeys = [dictRoot allKeys];
    NSMutableDictionary *contentData = [NSMutableDictionary dictionary] ;
    
    for ( int i = 0; i < [allKeys count]; i++ )
    {
        NSString *key = [allKeys objectAtIndex:i];
        NSDictionary *object = [dictRoot objectForKey:key];
        [contentData setObject:object forKey:key];
    }
    
    return contentData;
}
+( NSMutableArray *) loadAppArrayContentFrom: ( NSString * )plistFile
{
    //Load Data From Plist
    
    NSMutableArray *arrayRoot = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistFile ofType:@"plist"]];
    
    
    
    return arrayRoot;
    
    
}
//+(void) insertCategoriesinDB :(CategoriesHelper *)customer :(NSString*)tableName
//{
//    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
//    // NSLog(@"title------%@",customer.cat_title);
//    [db insertCategories  : customer :tableName];
//}
//
//+(void) insertProjectsinDB :(ProjectHelper *)customer :(NSString*)tableName
//{
//    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
//    // NSLog(@"title------%@",customer.project_title);
//    [db insertProjects:  customer :tableName];
//}
//+(void) insertProductsinDB :(ProductsHelper *)customer :(NSString*)tableName
//{
//    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
// //   // NSLog(@"title------%@",customer.cat_title);
//    [db insertProducts : customer :tableName];
//}


//
//
//+(NSMutableArray*) fetchCategoriesfromDB :(NSString*)tableName
//{
//
//    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
//
//   NSMutableArray* categories = [db getCategories:tableName];
//
//    // NSLog(@"customers count %lu",(unsigned long)[categories count]);
//
//    return categories;
//}
//
//+(NSMutableArray*) fetchProductsfromDB :(NSString*)tableName
//{
//
//    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
//
//    NSMutableArray* categories = [db getProducts:tableName];
//
//    // NSLog(@"customers count %lu",(unsigned long)[categories count]);
//
//    return categories;
//}
//+(NSMutableArray*) fetchProjectsfromDB :(NSString*)tableName
//{
//
//    FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
//
//    NSMutableArray* categories = [db getProjects:tableName];
//
//    // NSLog(@"customers count %lu",(unsigned long)[categories count]);
//
//    return categories;
//}
//
/* +(NSString *) getDatabasePath
 {
 NSString *databasePath = [(AppDelegate *)[[UIApplication sharedApplication] delegate] databasePath];
 
 return databasePath;
 }
 
 +(NSString *) getDatabasePathFavorite
 {
 NSString *databasePath = [(AppDelegate *)[[UIApplication sharedApplication] delegate] databasePathFavorite];
 
 return databasePath;
 } */


+(NSComparisonResult)getCompareResult : (NSDate*)compareValue1 : (NSDate*)compareValue2
{
    
    NSComparisonResult result = [compareValue1 compare:compareValue2];
    
    return result;
}

+ (UIColor*) randomColor
{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

/* +(void) deleteDatainTable :(NSString*)tableName
 {
 FMDBDataAccess *db = [[FMDBDataAccess alloc] init];
 
 [db deleteTables:tableName];
 } */
+(void)randomizeQuestions :(NSMutableArray*)customers
{
    /* myArray is a NSMutableArray with some objects */
    NSUInteger count = [customers count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        
        //   //// NSLog(@"value shuffled %ld witth %lu",(long)n,(unsigned long)i);
        [customers exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
}



+ (UIButton *)buttonWithTitle:(NSString *)title
                       target:(id)target
                     selector:(SEL)selector
                        frame:(CGRect)frame
                        image:(UIImage *)image
                 imagePressed:(UIImage *)imagePressed
                darkTextColor:(BOOL)darkTextColor
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
    [button setBackgroundImage:newImage forState:UIControlStateNormal];
    
    UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
    [button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // in case the parent view draws with a custom color or gradient, use a transparent color
    button.backgroundColor = [UIColor clearColor];
    
    return button;
}
+(UIBarButtonItem*)highlightedNavTextButton :(NSString*)title :(SEL)myAction
                                      target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0f, 0.0f, 50.0f, 32.0f);
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    button.titleLabel.textColor = [UIColor blackColor];
    button.titleLabel.shadowColor = [UIColor blackColor];
    button.titleLabel.shadowOffset = CGSizeMake(0.0f, -1.0f);
    [button addTarget:target action:myAction forControlEvents:UIControlEventTouchUpInside];
    button.showsTouchWhenHighlighted = YES;
    UIBarButtonItem *barButtonItemPrev = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItemPrev;
}

+(UIBarButtonItem*)highlightedNavImgButton : (NSString*)imgName :(SEL)myAction target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0f, 0.0f, 32.0f, 32.0f);
    [button setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30.0f];
    button.titleLabel.shadowColor = [UIColor blackColor];
    button.titleLabel.shadowOffset = CGSizeMake(0.0f, -1.0f);
    [button addTarget:target action:myAction forControlEvents:UIControlEventTouchUpInside];
    button.showsTouchWhenHighlighted = YES;
    UIBarButtonItem *barButtonItemPrev = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItemPrev;
}


/* +(UIBarButtonItem*)NavbarImgButton : (UIBarButtonSystemItem*)icon :(SEL)myAction
 {
 
 UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:*icon target:self action:myAction];
 
 return shareItem;
 } */

+ (NSString*)encodeStringTo64:(NSString*)fromString
{
    NSData *plainData = [fromString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String;
    if ([plainData respondsToSelector:@selector(base64EncodedStringWithOptions:)]) {
        base64String = [plainData base64EncodedStringWithOptions:kNilOptions];  // iOS 7+
    } /* else {
       base64String = [plainData base64Encoding];                              // pre iOS7
       } */
    
    return base64String;
}
+(void) clearUserDefaults
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}
+(BOOL) getUserDefaultBool :(NSString*)key
{
    BOOL completed = [[NSUserDefaults standardUserDefaults] boolForKey:key];
    return completed;
    
}
+(void) setUserDefaultBool :(Boolean)value key:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
    
}


+(NSInteger) getUserDefaultInt :(NSString*)key
{
    NSInteger completed = [[NSUserDefaults standardUserDefaults] integerForKey:key];
    return completed;
    
}
+(void) setUserDefaultInt :(NSInteger)value key:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key];
    
}
+(NSString*) getUserDefaultString :(NSString*)key
{
    NSString* completed = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return completed;
    
}
/**
 *  User Default String
 *
 *  @param value value
 *  @param key   key
 */
+(void) setUserDefaultString :(NSString*)value key:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    
}

+(NSInteger)timeDifferenceFromDate :(NSString*)newTime : (NSString*)oldTime
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *newDate = [formatter dateFromString:newTime];;
    NSDate *prevDate = [formatter dateFromString:oldTime];;
    NSTimeInterval distanceBetweenDates = [newDate timeIntervalSinceDate:prevDate];
    
    double minutresInAnHour = 60;
    NSInteger minutesBetweenDates = distanceBetweenDates / minutresInAnHour;
    return minutesBetweenDates;
}
+(NSInteger)dateDiffrenceFromDate:(NSString *)date1 :(NSString *)date2 {
    // Manage Date Formation same for both dates
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-yyyy"];
    NSDate *startDate = [formatter dateFromString:date1];
    NSDate *endDate = [formatter dateFromString:date2];
    
    
    unsigned flags = NSCalendarUnitDay;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
    
    NSInteger dayDiff = [difference day];
    
    return dayDiff;
}
// Formats the date chosen with the date picker.
+ (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy'/'MM'/'dd"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
/* + (MBProgressHUD *)showGlobalProgressHUDWithTitle:(NSString *)title {
 UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
 [MBProgressHUD hideAllHUDsForView:window animated:YES];
 MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
 hud.labelText = title;
 return hud;
 } */

/* + (void)dismissGlobalHUD {
 UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
 [MBProgressHUD hideHUDForView:window animated:YES];
 } */
/* +(NSDictionary *)jsonPostRequest:(NSString *)urlStr
 parameters:(NSDictionary *)parametersDictionary
 completionHandler:(void (^)(NSString*, NSDictionary*json))completionBlock
 onError:(void (^)(NSError *error))errorBlock
 {
 __block id json;
 
 
 NSURL *URL = [NSURL URLWithString:urlStr];
 
 
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 manager.responseSerializer = [AFHTTPResponseSerializer serializer];
 
 [manager POST:URL.absoluteString parameters:parametersDictionary progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
 NSError* error;
 json = [NSJSONSerialization JSONObjectWithData:responseObject
 options:kNilOptions
 error:&error];
 
 completionBlock(@"Success",json);
 } failure:^(NSURLSessionDataTask *task, NSError *error) {
 NSLog(@"Error: %@", error);
 completionBlock(@"Error",nil);
 }];
 return json;
 }*/
/* 
 +(NSDictionary *) getJsonData:(NSString *)urlStr
 parameters:(NSDictionary *)params
 onComplete:(void (^)(NSDictionary *json))successBlock
 onError:(void (^)(NSError *error))errorBlock{
 __block id json;
 
 NSURL *URL = [NSURL URLWithString:urlStr];
 
 
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 //   [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
 //  AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
 
 //    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
 //    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
 //    manager.requestSerializer = requestSerializer;
 manager.responseSerializer.acceptableContentTypes =
 [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
 [manager POST:URL.absoluteString parameters:params progress:nil
 success:^(NSURLSessionDataTask *  task, id responseObject)
 {
 NSLog(@"response  %@",responseObject);
 successBlock(responseObject);
 }
 failure:
 ^(NSURLSessionDataTask *operation, NSError *error){
 errorBlock(error);
 NSLog(@"Error: %@", error);
 }];
 return json;
 }
*/
/* + (NSString *)fromBase64String:(NSString *)string {
 NSData  *base64Data = [NSString base64DataFromString:string];
 
 NSString* decryptedStr = [[NSString alloc] initWithData:base64Data encoding:NSUnicodeStringEncoding];
 
 return decryptedStr ;
 } */

+ (void)showAlertIn:(UIViewController *)controller
          WithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitle
           tapBlock:(UIAlertCompletionBlock)tapBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if(cancelButtonTitle != nil) {
        
        UIAlertAction *cancelButton = [UIAlertAction
                                       actionWithTitle:cancelButtonTitle
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           tapBlock(alertController, 0); // CANCEL BUTTON CALL BACK ACTION
                                       }];
        [alertController addAction:cancelButton];
        
    }
    
    if(otherButtonTitle != nil) {
        
        UIAlertAction *otherButton = [UIAlertAction
                                      actionWithTitle:otherButtonTitle
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction *action)
                                      {
                                          tapBlock(alertController, 1); // OTHER BUTTON CALL BACK ACTION
                                      }];
        
        [alertController addAction:otherButton];
    }
    
    [controller presentViewController:alertController animated:YES completion:nil];
    
    //   return alertController;
}


+(void) showAlert:(NSString *)title message:(NSString *)msg
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:msg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        [alert dismissViewControllerAnimated:YES completion:nil];    }];
    [alert addAction:okAction];
    
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

//================================//
/* +(NSString*)moveTmpDubToSavedDubsForPath:(NSString*)path {
 
 //Create dub directory if needed
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
 NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
 NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"/dubs"];
 
 if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
 [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
 
 //Move dub to path
 NSString * finalDubPath = [Utility formattedDubPath:path];
 
 //Check if dub already exist
 if ([[NSFileManager defaultManager] fileExistsAtPath:finalDubPath])
 [[NSFileManager defaultManager] removeItemAtPath:finalDubPath error:nil];
 
 //Actual move
 [[NSFileManager defaultManager] copyItemAtPath:path toPath:finalDubPath error:nil];
 
 //Remove original
 [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
 
 //Create thumbnail of dub
 UIImage * thumbnail = [Utility thumbnailImageForVideo:[NSURL fileURLWithPath:finalDubPath]];
 NSData * imgData = UIImagePNGRepresentation(thumbnail);
 NSString * imgPath = [Utility thumbnailPathForDubWithURL:[finalDubPath lastPathComponent]];
 [imgData writeToFile:imgPath atomically:YES];
 
 return finalDubPath;
 } */

+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    int length = (int)[textField.text length] ;
    if (length >= MAXLENGTH && ![string isEqualToString:@""]) {
        textField.text = [textField.text substringToIndex:MAXLENGTH];
        return NO;
    }
    return YES;
}

+(NSString*)formattedDubPath:(NSString*)path {
    
    return [[Utility dubsDirectory] stringByAppendingPathComponent:[Utility dubUrlFromPath:path]];
    
}

+(NSString*)thumbnailPathForDubWithURL:(NSString*)url {
    
    NSString * noExt = [url stringByDeletingPathExtension];
    noExt = [noExt stringByAppendingPathExtension:@"png"];
    return [[Utility dubsDirectory] stringByAppendingPathComponent:[Utility dubUrlFromPath:noExt]];
    
}


+(NSString*)dubUrlFromPath:(NSString*)path {
    
    return [path lastPathComponent];
}

+(NSString*)randomDubPath {
    
    return [[Utility dubsDirectory] stringByAppendingPathComponent:[Utility randomDubName]];
    
}

+(NSString*)randomDubName {
    
    return [[Utility randomName] stringByAppendingString:@".mov"];
    
}

+(NSString*)dubsDirectory {
    
    return [[Utility documentDirectory] stringByAppendingPathComponent:@"/dubs"];
}

#pragma mark
#pragma mark - Sounds

+(NSString*)moveTmpSoundToSavedSoundsForPath:(NSString*)path {
    
    //Create dub directory if needed
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"/sounds"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
    
    //Move dub to path
    NSString * finalSoundPath = [Utility formattedSoundPath:path];
    
    //Check if dub already exist
    if ([[NSFileManager defaultManager] fileExistsAtPath:finalSoundPath])
        [[NSFileManager defaultManager] removeItemAtPath:finalSoundPath error:nil];
    
    //Actual move
    [[NSFileManager defaultManager] copyItemAtPath:path toPath:finalSoundPath error:nil];
    
    //Remove original
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
    return finalSoundPath;
    
}

+(NSString*)formattedSoundPath:(NSString*)path {
    
    return [[Utility soundsDirectory] stringByAppendingPathComponent:[Utility soundUrlFromPath:path]];
    
}

+(NSString*)soundUrlFromPath:(NSString*)path {
    
    return [path lastPathComponent];
}

+(NSString*)randomSoundPath {
    
    return [[Utility soundsDirectory] stringByAppendingPathComponent:[Utility randomSoundName]];
    
}

+(NSString*)randomSoundName {
    
    return [[Utility randomName] stringByAppendingString:@".m4a"];
    
}

+(NSString*)soundsDirectory {
    
    return [[Utility documentDirectory] stringByAppendingPathComponent:@"/sounds"];
}



#pragma mark
#pragma mark - General

+(NSString*)documentDirectory {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
}

//Generates a random name
+(NSString*)randomName {
    
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
    NSMutableString *s = [NSMutableString stringWithCapacity:30];
    for (NSUInteger i = 0U; i < 30; i++) {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return s;
}


//Clean TMP Directory
+(void)cleanTMPDirectory;
{
    
    NSArray* temp = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
    for (NSString *file in temp) {
        // NSLog(@"file %@", file);
        [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
    }
    
}

/* +(UIImage *)thumbnailImageForDub:(Dub *)dub {
 
 NSURL * dubURL = [NSURL fileURLWithPath:[Utility formattedDubPath:dub.url]];
 
 return [Utility thumbnailImageForVideo:dubURL];
 
 } */

/* +(UIImage *)thumbnailImageForVideo:(NSURL *)videoURL {
 
 AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
 NSParameterAssert(asset);
 
 AVAssetImageGenerator *assetIG = [[AVAssetImageGenerator alloc] initWithAsset:asset];
 assetIG.appliesPreferredTrackTransform = YES;
 assetIG.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
 
 CGImageRef thumbnailImageRef = NULL;
 CMTime time = [asset duration];
 time.value = 1000;
 
 NSError *igError = nil;
 thumbnailImageRef = [assetIG copyCGImageAtTime:time actualTime:NULL error:&igError];
 
 if (!thumbnailImageRef)
 // NSLog(@"thumbnailImageGenerationError %@", igError );
 
 UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef] : nil;
 
 return thumbnailImage;
 } */

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


//Screen
+(CGFloat)headerHeightWithStatuts:(BOOL)status andNav:(BOOL)nav {
    
    CGFloat toReturn = 0;
    
    if (status)
        toReturn += 20;
    
    if (nav) {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            toReturn += 44;
        
        else if (IsIPad)
            toReturn += 44;
        
    }
    
    
    return toReturn;
    
}

+(CGFloat)footerHeight {
    
    if (IsIPad)
        return 52.0;
    
    return 49.0;
    
}

//Controller
+ (id)getRootViewController {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }
    
    for (UIView *subView in [window subviews])
    {
        UIResponder *responder = [subView nextResponder];
        if([responder isKindOfClass:[UIViewController class]]) {
            return [self topMostViewController: (UIViewController *) responder];
        }
    }
    
    return nil;
}

+ (UIViewController *) topMostViewController: (UIViewController *) controller {
    BOOL isPresenting = NO;
    do {
        // this path is called only on iOS 6+, so -presentedViewController is fine here.
        UIViewController *presented = [controller presentedViewController];
        isPresenting = presented != nil;
        if(presented != nil) {
            controller = presented;
        }
        
    } while (isPresenting);
    
    // NSLog(@"Top View controller class : %@", NSStringFromClass(controller.class));
    
    return controller;
}

+(CGFloat)getBannerHeight:(UIInterfaceOrientation)orientation {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        if (UIInterfaceOrientationIsLandscape(orientation)) {
            return 32.0;
        }
        
        else {
            return 50.0;
        }
        
    }
    
    if (IsIPad) {
        
        if (!UIBarPositionTop)
            return 66.0;
        
        return 90;
        
        
        
    }
    
    return 0;
}

//+(CGFloat)bannerHeight {
//    return [Utility getBannerHeight:[UIDevice currentDevice].orientation];
//}

+(CGFloat)adjustedBannerPosition:(CGFloat)originalPosition {
    
    if (originalPosition > 0) {
        
        return originalPosition - [Utility footerHeight];
        
    }
    
    return originalPosition + [Utility headerHeightWithStatuts:TRUE andNav:TRUE];
    
}

+(UIButton*) addTargetButton :(UIButton*)btn :(SEL)myAction
{
    [btn addTarget:self action:myAction forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

+(void)setImageIcon:(UIImage*)image WithText:(NSString*)strText label:(UILabel*)lblName{
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    float offsetY = -4.5; //This can be dynamic with respect to size of image and UILabel
    attachment.bounds = CGRectIntegral( CGRectMake(0, offsetY, attachment.image.size.width, attachment.image.size.height));
    
    NSMutableAttributedString *attachmentString = [[NSMutableAttributedString alloc] initWithAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    NSMutableAttributedString *myString= [[NSMutableAttributedString alloc] initWithString:strText];
    
    [attachmentString appendAttributedString:myString];
    
    lblName.attributedText = attachmentString;
}


-(CGFloat)screenWidth {
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat width = screenRect.size.width;
    return width;
}

-(CGFloat)screenHeight {
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat height = screenRect.size.height;
    return height;
}

-(NSString *)changeHour: (NSString *)dateString
{
    NSDateFormatter *startTimeFormatter = [[NSDateFormatter alloc] init];
    startTimeFormatter.dateFormat = @"HH:mm:ss";
    NSDate *startTimeDate = [startTimeFormatter dateFromString:dateString];
    startTimeFormatter.dateFormat = @"hh:mm a";
    NSString *startTimeString = [startTimeFormatter stringFromDate:startTimeDate];
    
    NSDateFormatter *startTimeForrmat = [[NSDateFormatter alloc] init];
    [startTimeForrmat setDateFormat:@"hh:mma"];
    NSDate *startTimeFromString = [startTimeForrmat dateFromString:startTimeString];
    
    NSDateFormatter *startTimeHourFormatter = [[NSDateFormatter alloc] init];
    [startTimeHourFormatter setDateFormat:@"hh a"];
    NSString *startHourStr = [startTimeHourFormatter stringFromDate:startTimeFromString];
    return startHourStr;
}


#pragma mark - Resizeable Font

- (UIFont *)getResizeableFont:(UIFont *)currentFont {
    
    CGFloat sizeScale = 1;
    
    if (IS_IPHONE_DEVICE)
    {
        if ([Utility getCurrentDevice] == iPhone6Plus )
        {
            sizeScale = 1.3;
        }
        else if ([Utility getCurrentDevice] == iPhone6)
        {
            sizeScale = 1.2;
            
        }else {
            sizeScale = 1;
        }
    }
    else
    {
        sizeScale = 1.4;
    }
    return [currentFont fontWithSize:(currentFont.pointSize * sizeScale)];
}

-(NSInteger)currentYear {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currentYear = components.year;
    return currentYear;
}

-(NSInteger)currentMonth {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currentMonth = components.month;
    return currentMonth;
}


#pragma mark - Get Current Device Info

+ (currentDevice)getCurrentDevice
{
    if (([[UIScreen mainScreen] bounds].size.height == 480 && [[UIScreen mainScreen] bounds].size.width == 320) || ([[UIScreen mainScreen] bounds].size.width == 480 && [[UIScreen mainScreen] bounds].size.height == 320)) {
        return iPhone4;
    }
    else if (([[UIScreen mainScreen] bounds].size.height == 568 && [[UIScreen mainScreen] bounds].size.width == 320) || ([[UIScreen mainScreen] bounds].size.width == 568 && [[UIScreen mainScreen] bounds].size.height == 320))
        return iPhone5;
    else if (([[UIScreen mainScreen] bounds].size.height == 667 && [[UIScreen mainScreen] bounds].size.width == 375) || ([[UIScreen mainScreen] bounds].size.width == 667 && [[UIScreen mainScreen] bounds].size.height == 375))
        return iPhone6;
    else if (([[UIScreen mainScreen] bounds].size.height == 736 && [[UIScreen mainScreen] bounds].size.width == 414) || ([[UIScreen mainScreen] bounds].size.width == 736 && [[UIScreen mainScreen] bounds].size.height == 414))
        return iPhone6Plus;
    else if (([[UIScreen mainScreen] bounds].size.height == 768 && [[UIScreen mainScreen] bounds].size.width == 1024) || ([[UIScreen mainScreen] bounds].size.width == 1024 && [[UIScreen mainScreen] bounds].size.height == 768))
        return iPad;
    
    return 0;
}


+ (BOOL)float:(float)aFloat between:(float)minValue and:(float)maxValue {
    
    return (aFloat >= minValue && aFloat <= maxValue);
}

@end
