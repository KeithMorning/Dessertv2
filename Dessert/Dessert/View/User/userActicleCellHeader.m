//
//  userActicleCellHeader.m
//  Dessert
//
//  Created by keith on 15/4/12.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "userActicleCellHeader.h"

@implementation userActicleCellHeader

-(instancetype)initWithFrame:(CGRect)frame{
    self = [[[NSBundle mainBundle]loadNibNamed:@"userActicleCellHeader" owner:nil options:nil] lastObject];
    self.frame = frame;
    return self;
}
+(CGFloat)getHeaderHeight{
    return 44.0f;
}
@end
