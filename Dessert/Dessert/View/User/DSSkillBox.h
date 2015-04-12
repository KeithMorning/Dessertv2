//
//  DSSkillBox.h
//  Dessert
//
//  Created by keith on 15/4/12.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSSkillBox : UIView
@property(nonatomic,strong,readwrite) NSString *number;
@property (nonatomic,strong,readwrite) NSString *skillName;
-(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame withNum:(NSString*)number withSkil:(NSString *)skillName;
@end
