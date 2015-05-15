//
//  userSkillsTableViewCell.m
//  Dessert
//
//  Created by keith on 15/4/11.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "userSkillsTableViewCell.h"
#import "DSSkillBox.h"
@implementation userSkillsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    //[self updateConstraintsIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithSkill:(NSString *)skillName{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userSkillsTableViewCell"];
    if (self) {
        DSSkillBox *skillBox = [[DSSkillBox alloc]initWithFrame:CGRectMake(8, 8, 140,20) withNum:@"12" withSkil:skillName];
        self.autoresizesSubviews=NO;
        [self addSubview:skillBox];
    }
    
    return self;
}
@end
