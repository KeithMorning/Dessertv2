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
-(CGSize)getCGSizeWithFont:(UIFont*)font constrainedSize:(CGSize)size{
    CGSize stringsize=CGSizeZero;
    if (self.length<=0) {
        return stringsize;
    }
    if (NSFoundationVersionNumber>NSFoundationVersionNumber_iOS_6_1) {
        stringsize=[self boundingRectWithSize:size options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size;
    }else{
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        stringsize= [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
#endif
    }
    stringsize=CGSizeMake(MIN(size.width,ceilf(stringsize.width)), MIN(size.height, ceilf(stringsize.height)));//ceif 返回大于或等于该输入值的最小整数
    return stringsize;
}

//汉字转拼音
- (NSString *)chineseWordToPinyin{
    NSMutableString *source = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}

//生成A-Z字母
+ (NSMutableArray *)fromAtoZ{
    
    NSMutableArray *allLetter = [NSMutableArray array];
    
    for (char i = 'A'; i<'Z'+1; i++) {
        char key[2];
        key[0] = i;
        key[1] = '\0';
        
        [allLetter addObject:[NSString stringWithUTF8String:key]];
        
    }
    return allLetter;
}

@end
