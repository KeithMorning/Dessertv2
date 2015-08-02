//
//  DSConversationListTableViewCell.m
//  Dessert
//
//  Created by keith on 8/2/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSConversationListTableViewCell.h"

@interface DSConversationListTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *conversationTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *conversationDetailLable;

@end

@implementation DSConversationListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
