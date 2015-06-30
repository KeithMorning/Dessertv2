//
//  DSAddUserTableViewCell.m
//  Dessert
//
//  Created by keith on 6/30/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSAddUserTableViewCell.h"
#import "UIImageView+WebCache.h"
#define kAddImgeName @"addUser"
#define kAddedImageName @"haveAddedUser"

@interface DSAddUserTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIImageView *userImagView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation DSAddUserTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.nameLable.textColor = [UIColor colorWithHex:kLabelColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCell:(NSString *)username userImage:(NSString *)url buttonType:(DSAddUserButtonType)type{
    self.nameLable.text = username;
    NSURL *imageUrl = [NSURL URLWithString:url];
    [self.userImagView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:kPlaceHolderImage]];
    UIImage *buttonImage = [self getImageByType:type];
    self.addButton.imageView.image = buttonImage;
}

- (UIImage *)getImageByType:(DSAddUserButtonType)type{
    if (type == DSAddUserButtonTypeAdd) {
       return  [UIImage imageNamed:kAddImgeName];
    }else if(type == DSAddUserButtonTypeAdded){
        return [UIImage imageNamed:kAddedImageName];
    }
    return nil;
}

@end
