//
//  UISearchBar+common.m
//  Dessert
//
//  Created by keith on 6/28/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "UISearchBar+common.h"

@implementation UISearchBar (common)
- (void)insertBGColor:(UIColor *)backgroundColor{
    static NSInteger customBgTag = 999;
    UIView *realView = [[self subviews] firstObject];
    [[realView subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if (obj.tag == customBgTag) {
            [obj removeFromSuperview];
        }
    }];
    if (backgroundColor) {
        UIImageView *customBg = [[UIImageView alloc] initWithImage:[UIImage imageWithColor:backgroundColor withFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) + 20)]];
        CGRect frame = customBg.frame;
        frame.origin.y = -20;
        customBg.frame = frame;
        customBg.tag = customBgTag;
        [[[self subviews] firstObject] insertSubview:customBg atIndex:1];
    }
}
@end
