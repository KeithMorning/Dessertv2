//
//  BlogBaseTableViewCell.h
//  Dessert
//
//  Created by keith on 15/3/28.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSContent.h"

@interface BlogBaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *VoteUpButton;
@property (weak, nonatomic) IBOutlet UIButton *VoteDownButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (nonatomic,strong) DSContent *content;
- (instancetype)initWithItItentifier:(NSString *)cellIndetifier;
- (void)setModelValue:(DSContent *)Model;
+ (CGFloat)cellHeight;
@end
