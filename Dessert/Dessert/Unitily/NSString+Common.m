//
//  NSString+Common.m
//  Dessert
//
//  Created by keith on 15/3/22.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)
- (NSRange)rangeByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet{
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    for (length = [self length]; length > 0; length--) {
        if (![characterSet characterIsMember:charBuffer[length - 1]]) {
            break;
        }
    }
    return NSMakeRange(location, length - location);
}
@end
