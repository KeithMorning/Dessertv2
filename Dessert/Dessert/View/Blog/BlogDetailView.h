//
//  BlogDetailView.h
//  Dessert
//
//  Created by keith on 15/3/29.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>
#import "DSContent.h"
@interface BlogDetailView : UIView
@property (weak, nonatomic) IBOutlet UIButton *voteUpBtn;
@property (weak, nonatomic) IBOutlet UIButton *voteDownBtn;
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *blogContentLab;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *userNameLab;
- (instancetype)initWithFrame:(CGRect)frame withModle:(DSContent *)Model;
-(CGFloat)GetHeaderHight;
@end
