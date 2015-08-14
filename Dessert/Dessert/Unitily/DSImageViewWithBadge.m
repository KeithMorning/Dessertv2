//
//  DSImageViewWithBadge.m
//  Dessert
//
//  Created by keithxi on 8/14/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSImageViewWithBadge.h"

const CGFloat badgeRadius = 14;

@interface DSImageViewWithBadge()

@property (nonatomic,strong) UILabel *badgeLabel;
@property (nonatomic,strong) UIView *badgeView;

@end

@implementation DSImageViewWithBadge

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.badgeLabel = [[UILabel alloc] init];
    self.badgeView = [[UIView alloc]init];
    self.badgeLabel.frame = [self getbabagePostion];
    self.badgeView.frame = [self getbabagePostion];
    
    [self addSubview:self.badgeView];
    [self addSubview:self.badgeLabel];
    
}

- (CGRect)getbabagePostion{
    CGRect rect = self.bounds;
    CGRect postionRect = CGRectMake(rect.size.width-badgeRadius, badgeRadius, badgeRadius, badgeRadius);
    return postionRect;
    
}

- (void)updateBageContent:(NSString *)number{
    self.badgeView.hidden = YES;
    
}

- (void)updateBagePicture:(UIView *)view{
    self.badgeLabel.hidden = YES;
    view.frame = self.badgeView.bounds;
    [self.badgeView addSubview:view];
}
@end
