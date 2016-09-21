//
//  Constants.h
//
//  Created by Umair Qureshi on 25/08/2014.
//  Copyright (c) 2014 Umair Qureshi. All rights reserved.
//
#import "Utility.h"

//// color

#define _RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kCLR_RANDOM_COLOR _RGB(arc4random()%255, arc4random()%255, arc4random()%255, 1)

#define ARR_COLOR [NSArray arrayWithObjects:_RGB(255, 115, 38, 1),_RGB(98, 217, 255, 1),_RGB(38, 255, 150, 1), _RGB(38, 79, 255, 1), _RGB(212, 38, 255, 1), nil]

//iPhone5 helper
#define ASSET_BY_SCREEN_HEIGHT(regular) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : [regular stringByAppendingString:@"-568h"])

//iPhone Or iPad
#define isiPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

//iOS7 Or less
#define ISIOS7 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)


#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define DLog(...)
#endif

#define IsIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsIPhone5 ([[UIScreen mainScreen] bounds].size.height == 568)

//Api Url

#define mapQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)





#define MAXLENGTH 10
#define APP_LANG_ENGLISH 1
#define APP_LANG_ARABIC 2

#define TAG_FOR_HEADING 10
#define TAG_SWITCH_LANG 11


// check for internet connection

/* AppDelegate object */
#define APP_DELEGATE1 ((AppDelegate*)[[UIApplication sharedApplication] delegate])


// unit if for Admob Ads

#define IPhone5_4_Difference 88


// exercise workout time

#define kExerciseDuration 30.0
#define kRestDuration 10.0

#define LANGUAGE_SELECTION @"LanguageSelection"

#define RESOURCE_NAME( NAME ) [Utility getImageNameFor: NAME]


#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)





// LTF designs define

#define IS_IOS_6 ([[[UIDevice currentDevice] systemVersion] floatValue])


#define IS_IPOD   ( [[[UIDevice currentDevice ] model] isEqualToString:@"iPod touch"] )
///////////////////////////////////
//Device and displays
///////////////////////////////////
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0 )
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define IS_IPHONE_6PLUS (IS_IPHONE && [[UIScreen mainScreen] nativeScale] == 3.0f)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)


//Screen Sizes

#define IS_IPHONE_DEVICE                (([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)?NO:YES)

#define IS_IPHONE5                      (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_IPHONE6_Plus                 (([[UIScreen mainScreen] bounds].size.height-736)?NO:YES)
#define IS_IPHONE6                      (([[UIScreen mainScreen] bounds].size.height-667)?NO:YES)
#define IS_IPHONE4                      (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)

#define IPHONE4S_RATIO 1.252
#define IPHONE5_RATIO 1.038

#define   IsIphone5     ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//// Local SERVICE URLs

#define IPHONE4S @"iphone4s"
#define IPHONE5 @"iphone5"
#define IPAD @"ipad"
#define IPAD_RETINA @"ipadretina"

/* #define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen) */
//////////////////////////////////


// Error Messages
#define INTERNET_INAVAILABLE_MSG @"Internet has not been detected on your device. Please check your internet settings again to proceed!"
#define SOMETHING_WENT_WRONG_MSG @"Something went wrong while fetching your request. Please try again later!"
#define FEATURE_FEED_ERROR_MSG @"Something went wrong while fetching the Kurfuffls. Please try again later"
#define FEED_CELL_CUSTOM_MSG @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
#define LOCATION_OFF_QIBLA @"Turn on your Location Service to get current direction."
#define LOCATION_OFF_PLAYER @"Turn on your Location Service to get accurate Prayer Timings."
#define USERNAME_PASSWORD_EMPTY @"Username and password cannot be empty !!"

// Text View Sizes
#define FEEDCELL_TEXT_VIEW_SIZE CGSizeMake(205, 12)

// Color From Hex
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

//constants for FindingQiblaViewController
#define toRad(X) (X*M_PI/180.0)
#define toDeg(X) (X*180.0/M_PI)
#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

