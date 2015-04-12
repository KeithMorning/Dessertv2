//
//  userExpericeTableViewCell.m
//  Dessert
//
//  Created by keith on 15/4/11.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "userExpericeTableViewCell.h"
#define KminiHeight 44.0;
@implementation userExpericeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    [self updateConstraintsIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithUserExperience:(NSString *)info{
    self = [[[NSBundle mainBundle]loadNibNamed:@"userExpericeTableViewCell" owner:nil options:nil] lastObject];
    if(self){
        if (info==nil) {
            info = @"暂无消息啊";
        }
        
        self.userExpericeLab.text = info;
        CGRect frame = self.frame;
        frame.size.height = [self getCellHeight];
        self.frame=frame;
        
    }
    return self;
}

-(CGFloat)getCellHeight{
     CGFloat height = [DSTextCGSize TextSizeInLable:self.userExpericeLab].height +60;
    if (height > 44) {
        return height;
    }
    return KminiHeight;
}
@end
