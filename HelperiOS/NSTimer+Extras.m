//
//  NSTimer+Extras.m
//
//  Created by Umair Qureshi on 8/22/11.
//  Copyright (c) 2011 Umair Qureshi. All rights reserved.
//


#import "NSTimer+Extras.h"

@implementation NSTimer (Extras)
NSDate *pauseStart, *previousFireDate;
-(void)pauseTimer{
    pauseStart = [NSDate dateWithTimeIntervalSinceNow:0];
    
    previousFireDate = [self fireDate] ;
    
    [self setFireDate:[NSDate distantFuture]];
}
-(void)resumeTimer{
    float pauseTime = -1*[pauseStart timeIntervalSinceNow];
    
    [self setFireDate:[previousFireDate initWithTimeInterval:pauseTime sinceDate:previousFireDate]];
    

}
@end
