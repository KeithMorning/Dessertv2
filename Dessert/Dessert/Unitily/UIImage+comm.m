//
//  UIImage+comm.m
//  Dessert
//
//  Created by keith on 6/28/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "UIImage+comm.h"

@implementation UIImage (comm)
+ (UIImage *)imageWithColor:(UIColor *)color{
    return   [self imageWithColor:color withFrame:CGRectMake(0, 0, 1, 1)];
    
}
+ (UIImage *)imageWithColor:(UIColor *)color withFrame:(CGRect)frame{
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, frame);
    UIImage *img =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
