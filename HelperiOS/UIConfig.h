//
//  UIConfig.h
//  ayahoftheday
//
//  Created by Umair on 15/12/2014.
//  Copyright (c) 2014 Muhammad Umair Qureshi. All rights reserved.
//

//CONFIG FOR THE GENERAL LOOK AND FEEL OF THE APP.
//MOST OF THE FILE CAN BE EDITED DIRECTLY WITH INTERFACE BUILDER
//BUT SOME "GENERALITIES" CAN BE FOUND HERE TO AVOID EDITING EACH CONTROLLER
//THIS MIGHT NOT BE PERFECT AND PLEASE, IF YOU NOTICE A VAR NOT DOING ANYTHING
//EMAIL ME AT naxx.technologies@gmail.com TO REPORT THE BUG SO I CAN UPDATE THE CODE ASAP.
//ALL VAR ARE NAMED TO BE EASILY UNDERSTOOD

#import "Utility.h"
#import "Constants.h"




////////////////
//Fonts
////////////////
#define kMainFont                       [UIFont fontWithName:@"HelveticaNeue" size:15.0]
#define kLightFont                      [UIFont fontWithName:@"HelveticaNeue" size:13.0]
#define kHighlightFont                  [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0]

///////////////
//Colors
///////////////
#define kMainColor                      [UIColor blackColor]
#define kLightColor                     [UIColor lightTextColor]
#define kHighlightColor                 [UIColor lightBlueColor]

/////////////////////
// CONTROLLERS
/////////////////////

///////////////////////////////
//Capture VC / Player VC
///////////////////////////////
//Audio waveform color
#define kCaptureViewWavesColor          [UIColor orangeColor]

//Background buttons background color
#define kStartBgColor                   [UIColor colorWithRed:0/255.0f green:184.0/255.f blue:99/255.f alpha:1.0] //Button start
#define kResumeBgColor                  [UIColor colorWithRed:0/255.0f green:184.0/255.f blue:99/255.f alpha:1.0] //Button resume
#define kPauseBgColor                   [UIColor orangeColor] //Button pause
#define kActionBgColor                  [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] //Button action in general (next, etc...)
#define kCancelBgColor                  [UIColor redColor] //Button cancel

//Font and text color for actions buttons
#define kActionButtonFont               [UIFont fontWithName:@"HelveticaNeue-Medium" size:25.0] //All buttons
#define kActionButtonFontColor          [UIColor whiteColor] //All button


/////////////////////////////
//Sharing VC
/////////////////////////////
#define kSharingCellHeight              70.0

//Font of button in cell
#define kSharingCellFont                [UIFont fontWithName:@"HelveticaNeue-Medium" size:22.0]
#define kSharingCellTextColor           [UIColor whiteColor]

//Background color of cell
#define kSharingCellFacebookBgColor     [UIColor colorWithRed:59/255.0f green:89/255.0f blue:152/255.0f alpha:1.0]
#define kSharingCellMessageBgColor      [UIColor colorWithRed:14/255.0f green:186/255.0f blue:42/255.0f alpha:1.0]
#define kSharingCellEmailBgColor        [UIColor colorWithRed:26/255.0f green:212/255.0f blue:253/255.0f alpha:1.0]
#define kSharingCellWhatsappBgColor     [UIColor colorWithRed:84/255.0f green:199/255.0f blue:60/255.0f alpha:1.0]
#define kSharingCellCameraBgColor       [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1.0]

/////////////////////////
// Main layout
////////////////////////

//Category Cell
#define kCategoryCellBgColor            [UIColor clearColor]
#define kCategoryCellSelectedBgColor    [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];

//Sound Cell
#define kSoundCellHeight                50.0

#define kSoundActionSuggestColor        kActionBgColor //Refer to wizard/capture colors
#define kSoundActionDeleteColor         kCancelBgColor
#define kSoundActionAddFavColor         kActionBgColor
#define kSoundActionDelFavColor         kResumeBgColor

//Video Cell
#define kVideoCellHeight                90.0
#define kVideoActionDeleteColor         kCancelBgColor
#define kVideoActionShareColor          kStartBgColor

////////////////////////////
// Audio creation
////////////////////////////

//Record Time - Displayed when user create a new sound from microphone
#define kRecordTimeFont                 [UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0]
#define kRecordTimeColor                [UIColor blackColor]

//Extract iPod Audio - Displayed when user create a new sound from iPod Library
#define kAudioDurationFont              [UIFont fontWithName:@"HelveticaNeue-Medium" size:25.0]
#define kAudioDurationColor             [UIColor blackColor]
#define kAudioTrimmerViewMargin         12.0
#define kAudioExtractorMiniWaveColor    [UIColor blackColor]
#define kAudioExtractorZoomedWaveColor  [UIColor colorWithRed:0/255.0f green:184.0/255.f blue:99/255.f alpha:1.0]

////////////////////////////
//Settings
///////////////////////////

#define kSettingCellHeight                          50.0

#define kSettingCellFont                            [UIFont fontWithName:@"HelveticaNeue" size:14.0]
#define kSettingCellFontColor                       [UIColor darkGrayColor]
#define kSettingCellHighlightFont                   [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0]
#define kSettingCellHighlightFontColor              [UIColor blackColor]

//////////////////////////
//Language
/////////////////////////
#define kLangCellHeight                 50.0
#define kLangCellSwitchOnColor          [UIColor colorWithRed:0/255.0f green:184.0/255.f blue:99/255.f alpha:1.0]


//////////////////////////
//Theme Color
/////////////////////////

#define kThemeColorBlack                @"#000000"
#define kThemeColorGolden               @"#ca9f27"
#define kThemeColorGreen                @"#a2b82c"
#define kThemeColorOrange               @"#d6470f"
#define kThemeColorBlue                 @"#007ee5"
#define kThemeColorPink                 @"#b82c7d"
#define kThemeColorPink                 @"#b82c7d"
///////////////
//Colors
///////////////
#define kBackgroundColor                @"#e0e0e0"
#define kBlackThemeBgColor              @"#1b1b1b"


#define kCorrectAnsColor                @"#e0e0e0"
#define kWrongAnsColor                  @"#e0e0e0"

