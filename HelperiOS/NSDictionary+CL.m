//
//  NSDictionary+CL.m
//
//  Created by Caesar on 10/12/2014.
//  Copyright (c) 2014 Umair Qureshi. All rights reserved.
//

#import "NSDictionary+CL.h"

@implementation NSDictionary (CL)
- (id)objectForKeyWithNil:(id)aKey {
    if(!self) return nil;
    id object = [self objectForKey:aKey];
    if (object == [NSNull null]) {
        return nil;
    }
    return object;
}
@end
