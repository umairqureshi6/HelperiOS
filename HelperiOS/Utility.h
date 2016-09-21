//
//  Utility.h
//
//
//  Created by Umair Qureshi on 22/11/2013.
//  Copyright (c) 2013 Umair Qureshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject
//init
-(id) init;
+ (Utility *)sharedObject;
typedef void (^UIAlertCompletionBlock) (UIAlertController *alertViewController, NSInteger buttonIndex);

typedef enum {
    
    iPhone4,
    iPhone5,
    iPhone6,
    iPhone6Plus,
    iPad
}currentDevice ;

+ (currentDevice)getCurrentDevice;



//Distance convertion methods
+(double)meterToKilometer:(double)meter;
+(double)kilometerToMeter:(double)kilometer;
+(double)meterToMiles:(double)meter;
+(double)milesToMeter:(double)miles;
+(double)kilometerToMiles:(double)kilometer;
+(double)milesToKilometer:(double)miles;


//String Utillity Functions
+(NSString *) trimString:(NSString *)theString;
+(NSString *) removeNull:(NSString *) string;
+(NSString *) getTrimText:(UITextField *) textfield;
+(Boolean) hasText : (UITextField*)textfield;

//Directory Path Methods
+ (NSString *)applicationDocumentDirectoryString;
+ (NSString *)applicationCacheDirectoryString;
+ (NSURL *)applicationDocumentsDirectoryURL;

//Scale and Rotate according to Orientation
- (UIImage *)scaleAndRotateImage:(UIImage *)image;

//Email Validation
+(BOOL)isValidEmailAddress:(NSString *)email;
+(BOOL)isvalidPassword:(NSString *)password;

+(BOOL)isPasswordMatch:(NSString *)pwd withConfirmPwd:(NSString *)cnfPwd ;

//UserDefault helper

//Show Alert
//+(void)showAlertWithTitle:(NSString *)strTitle andMessage:(NSString *)strMsg;
+ (void)showAlertIn:(UIViewController *)controller
          WithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitle
           tapBlock:(UIAlertCompletionBlock)tapBlock;

//datetime helper
+(NSString*) currentDate;
+(NSString*) currentDateTime;
+(NSString*) currentDateTimeWithTimeZone;
+(NSString*)currentTimeWithAmPm;
+(NSDate*) currentDateWithTimeAmPm :(NSString*)timeAmPm;

+(NSString*) currentDateWithFormat :(NSString*)format;
+( NSDate*)getDeviceCurrentDateWithTimeZone;

+ (NSDate *)stringToDate:(NSString *)dateString;
+ (NSDate *)stringToDate:(NSString *)dateString withFormate:(NSString *)format;
+ (NSString *)DateToString:(NSDate *)date;
+(NSString *)DateToString:(NSDate *)date withFormate:(NSString *)format;
//+(NSString *)DateToStringForScanQueue:(NSDate *)date;
+(NSString *)DateToString:(NSDate *)date withFormateSufix:(NSString *)format;
+ (NSString *)stringToLongDate:(NSString *)dateString;

-(int)dateDiffrenceFromDateInString:(NSString *)date1 second:(NSString *)date2;
-(int)dateDiffrenceFromDate:(NSDate *)startDate second:(NSDate *)endDate;
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
+ (NSString *)formatDate:(NSDate *)date;
+ (NSDate *)dateModifiedWithHours:(NSString *)hours
                          minutes:(NSString *)minutes
                        andPeriod:(NSString *)period;
//tableview helper
-(void)setTableViewHeightWithNoLine:(UITableView *)tbl;

//baritem helper
-(UIBarButtonItem *)setBackbarButtonWithName:(NSString *)strName;
+(UIBarButtonItem*)highlightedNavTextButton : (NSString*)title :(SEL)myAction target:(id)target;
+(UIBarButtonItem*)highlightedNavImgButton : (NSString*)img :(SEL)myAction target:(id)target;

//+(UIBarButtonItem*)NavbarImgButton : (UIBarButtonSystemItem*)icon :(SEL)myAction;


+ (UIButton *)buttonWithTitle:(NSString *)title
                       target:(id)target
                     selector:(SEL)selector
                        frame:(CGRect)frame
                        image:(UIImage *)image
                 imagePressed:(UIImage *)imagePressed
                darkTextColor:(BOOL)darkTextColor;
//=======================================================//
+ (UIColor *)colorWithHexString:(NSString *)hexString;
//File system
+(void)cleanTMPDirectory;

//Dubs
//+(NSString*)moveTmpDubToSavedDubsForPath:(NSString*)path;
+(NSString*)formattedDubPath:(NSString*)path;
+(NSString*)dubUrlFromPath:(NSString*)path;
+(NSString*)thumbnailPathForDubWithURL:(NSString*)url;
+(NSString*)randomDubPath;
+(NSString*)randomDubName;
+(NSString*)dubsDirectory;
+(NSString*)randomName;

//Sounds
+(NSString*)moveTmpSoundToSavedSoundsForPath:(NSString*)path;
+(NSString*)formattedSoundPath:(NSString*)path;
+(NSString*)soundUrlFromPath:(NSString*)path;
+(NSString*)randomSoundPath;
+(NSString*)randomSoundName;
+(NSString*)soundsDirectory;

//Video
//+(UIImage *)thumbnailImageForDub:(Dub*)dub;
+ (UIImage *)imageWithColor:(UIColor *)color;

//Screen
+(CGFloat)headerHeightWithStatuts:(BOOL)status andNav:(BOOL)nav;
+(CGFloat)footerHeight;
+(id)getRootViewController;
//+(CGFloat)bannerHeight;
+(CGFloat)adjustedBannerPosition:(CGFloat)originalPosition;


+ ( NSString * ) getImageNameFor: (NSString *) imageName;
+ ( NSDictionary * ) loadAppDictContentFrom : ( NSString * )plistFile;
+ ( NSMutableArray * ) loadAppArrayContentFrom : ( NSString * )plistFile;

+(void) showAlert:(NSString *) title message:(NSString *) msg;
+(bool) isNetworkAvailable;



//+(void) insertCategoriesinDB :(CategoriesHelper *)categories :(NSString*)tableName;
//+(void) insertProductsinDB :(ProductsHelper *)products :(NSString*)tableName;
//+(void) insertProjectsinDB :(ProjectHelper *)projects :(NSString*)tableName;
// + (NSDictionary *) getJsonData:(NSString *)urlStr
// parameters:(NSDictionary *)params
// onComplete:(void (^)(NSDictionary *json))successBlock
// onError:(void (^)(NSError *error))errorBlock;
 
// +(NSDictionary *)jsonPostRequest:(NSString *)urlStr
// parameters:(NSDictionary *)parametersDictionary
// completionHandler:(void (^)(NSString*, NSDictionary*json))completionBlock
// onError:(void (^)(NSError *error))errorBlock;

+(NSInteger)timeDifferenceFromDate :(NSString*)time1 : (NSString*)time2;
+(NSInteger)dateDiffrenceFromDate:(NSString *)date1 :(NSString *)date2 ;



//+ (MBProgressHUD *)showGlobalProgressHUDWithTitle:(NSString *)title ;
//+ (void)dismissGlobalHUD ;


// User Defaults
+(void) clearUserDefaults;
+(void) setUserDefaultBool :(Boolean)value key:(NSString*)key;
+(BOOL) getUserDefaultBool :(NSString*)key;

+(NSString*) getUserDefaultString :(NSString*)key;
+(void) setUserDefaultString :(NSString*)value key:(NSString*)key;


+(void) setUserDefaultInt :(NSInteger)value key:(NSString*)key;
+(NSInteger) getUserDefaultInt :(NSString*)key;



/* +(void) deleteDatainTable :(NSString*)tableName;
 +(NSMutableArray*) fetchCategoriesfromDB :(NSString*)tableName;
 +(NSMutableArray*) fetchProductsfromDB :(NSString*)tableName;
 +(NSMutableArray*) fetchProjectsfromDB :(NSString*)tableName; */
+ (UIColor*) randomColor;

+(NSComparisonResult)getCompareResult : (NSDate*)compareValue1 : (NSDate*)compareValue2;


+(void)randomizeQuestions :(NSMutableArray*)customers;
+ (NSString*)encodeStringTo64:(NSString*)fromString;

/* + (NSString *) getDatabasePath;
 +(NSString *) getDatabasePathFavorite; */


// Add target to button
+(UIButton*) addTargetButton :(UIButton*)btn :(SEL)myAction;
+ (BOOL)float:(float)aFloat between:(float)minValue and:(float)maxValue;
@end
