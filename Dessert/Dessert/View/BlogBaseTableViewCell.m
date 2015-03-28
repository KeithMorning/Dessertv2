//
//  BlogBaseTableViewCell.m
//  Dessert
//
//  Created by keith on 15/3/28.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "BlogBaseTableViewCell.h"
#import "MKToPainText.h"
#define kCellHeight 88.0f
@implementation BlogBaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithItItentifier:(NSString *)cellIndetifier{
    BlogBaseTableViewCell *cell =[[[NSBundle mainBundle]loadNibNamed:@"BlogBaseTableViewCell" owner:nil options:nil]lastObject];
    [cell setRestorationIdentifier:cellIndetifier];
    //username,time,scores,voteFlag
    return cell;
}
-(void)setModelValue:(DSContent *)Model{
    self.titleLable.text = Model.title;
    self.contentLable.text =[[[MKToPainText alloc]init]MKToText: Model.text];
}

+ (CGFloat)cellHeight{
    return kCellHeight;
}
@end
