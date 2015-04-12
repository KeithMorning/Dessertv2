//
//  userSkillHeaderView.m
//  Dessert
//
//  Created by keith on 15/4/12.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "userSkillHeaderView.h"

@implementation userSkillHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [[[NSBundle mainBundle]loadNibNamed:@"userSkillHeaderView" owner:nil options:nil] lastObject];
    if (self) {
        self.frame =frame;
    }
    return self;
}
+(CGFloat)getHeaderHeight{
    return 44.0f;
}

@end
