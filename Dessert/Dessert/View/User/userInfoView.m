//
//  userInfoView.m
//  Dessert
//
//  Created by keith on 15/4/11.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "userInfoView.h"
@implementation userInfoView

-(instancetype)initWithFrame:(CGRect)frame userHeaderModel:(DSUser *)user{
    self = [[[NSBundle mainBundle]loadNibNamed:@"userInfoView" owner:nil options:nil] lastObject];
    if (self) {
        self.frame = frame;
        //view model save here
    }
    [self.userImageView doCircleFrame];
    return  self;
}

+(CGFloat)getHeaderHeight{
    return 200;
}
@end
