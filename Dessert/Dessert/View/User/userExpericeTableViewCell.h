//
//  userExpericeTableViewCell.h
//  Dessert
//
//  Created by keith on 15/4/11.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userExpericeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userExpericeLab;
- (instancetype)initWithUserExperience:(NSString *)info;
-(CGFloat)getCellHeight;
@end
