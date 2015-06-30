//
//  AMleftMenuHeader.m
//  Dessert
//
//  Created by keith on 6/10/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "AMleftMenuHeader.h"

@interface AMleftMenuHeader()

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;


@end

@implementation AMleftMenuHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"AMleftMenuHeader" owner:nil options:nil] lastObject];
    self.frame = frame;
    [self.UserImageView doCircleFrame];
    return self;
}


- (void)setUserName:(NSString *)userName{
    _userName = userName;
    self.userNameLabel.text = userName;
}

@end
