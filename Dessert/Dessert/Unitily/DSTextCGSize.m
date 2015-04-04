//
//  DSTextCGSize.m
//  Dessert
//
//  Created by keith on 15/3/31.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSTextCGSize.h"

@implementation DSTextCGSize
+ (CGSize)TextSizeInLable:(UILabel *)lable{
    CGSize size = CGSizeZero;
    size = [lable.text  getCGSizeWithFont:lable.font constrainedSize: CGSizeMake(lable.bounds.size.width, 1000)];
    return size;
}
@end
