//
//  NSString+Common.h
//  Dessert
//
//  Created by keith on 15/3/22.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)
- (NSRange)rangeByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet;
@end
