//
//  AMLeftMenuTableViewCell.m
//  Dessert
//
//  Created by keith on 6/13/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "AMLeftMenuTableViewCell.h"

@interface AMLeftMenuTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftTitleLable;

@end
@implementation AMLeftMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setLeftImage:(UIImage *)leftImage{
    _leftImage = leftImage;
    _leftImageView.image = _leftImage;
}

- (void)setLeftTitle:(NSString *)leftTitle{
    _leftTitle = leftTitle;
    _leftTitleLable.text = _leftTitle;
}

@end
