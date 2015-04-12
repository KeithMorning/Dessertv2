//
//  DSSkillBox.m
//  Dessert
//
//  Created by keith on 15/4/12.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSSkillBox.h"
@interface DSSkillBox()
@property (weak, nonatomic) IBOutlet UILabel *numberLab;
@property (weak, nonatomic) IBOutlet UILabel *skillNameLab;

@end
@implementation DSSkillBox

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth=1;
    self.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
}
-(instancetype)initWithFrame:(CGRect)frame withNum:(NSString *)number withSkil:(NSString *)skillName{
    self = [[[NSBundle mainBundle]loadNibNamed:@"DSSkillBox" owner:nil options:nil]lastObject];
    self.frame = frame;
    self.skillName = skillName;
    self.number = number;
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame withNum:nil withSkil:nil];
}
-(void)setNumber:(NSString *)number{
    _number = number;
    self.numberLab.text = number;
    
}
-(void)setSkillName:(NSString *)skillName{
    _skillName = skillName;
    self.skillNameLab.text = skillName;
}

@end
