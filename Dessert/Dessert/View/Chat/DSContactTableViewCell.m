//
//  DSContactTableViewCell.m
//  Dessert
//
//  Created by keith on 6/23/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSContactTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface DSContactTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImagView;
@end

@implementation DSContactTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.nameLabel.textColor= [UIColor colorWithHex:kLabelColor];ß
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithUser:( DSAVUser*)user{
    _nameLabel.text = user.username;
    AVFile *file = user.userImage;
    NSURL *url = [NSURL URLWithString:file.url];
    [_userImagView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"userPlaceHolder"]];
    [_userImagView doCircleFrame];
}

@end
