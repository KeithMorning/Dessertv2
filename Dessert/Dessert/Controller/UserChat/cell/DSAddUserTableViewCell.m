//
//  DSAddUserTableViewCell.m
//  Dessert
//
//  Created by keith on 6/30/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSAddUserTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "PSTAlertController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "JDStatusBarNotification.h"

#define kAddImgeName @"addUser"
#define kAddedImageName @"haveAddedUser"


@interface DSAddUserTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIImageView *userImagView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (nonatomic) DSAddUserButtonType userType;
@property (nonatomic,weak) DSAVUser *follower;



@end

@implementation DSAddUserTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.nameLable.textColor = [UIColor colorWithHex:kLabelColor];
    [self.userImagView doCircleFrameWithBorder];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCell:(DSAVUser *)addUser buttonType:(DSAddUserButtonType)type{
    self.follower = addUser;
    self.nameLable.text = addUser.username;
    self.userType = type;
    NSURL *imageUrl = [NSURL URLWithString:addUser.userImage.url];
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
- (IBAction)addButtonClick:(id)sender {
    NSString *message = nil;
    PSTAlertAction *action;
    WEAKSELF
    if (self.userType == DSAddUserButtonTypeAdd) {
        message = [NSString stringWithFormat:@"确定添加%@到你的朋友列表？",self.follower.username];
        action = [PSTAlertAction actionWithTitle:@"添加" handler:^(PSTAlertAction *action) {
            [weakSelf addToMyFollowee];
        }];
    }
    else{
        message = [NSString stringWithFormat:@"确定删除好友%@",self.follower.username];
        action = [PSTAlertAction actionWithTitle:@"删除" handler:^(PSTAlertAction *action) {
            [weakSelf addToMyFollowee];
        }];
    }
    PSTAlertAction *cancelAction = [PSTAlertAction actionWithTitle:@"取消" style:PSTAlertActionStyleCancel handler:nil];
    PSTAlertController *alertContoller = [PSTAlertController alertWithTitle:@"提示" message:message];
    [alertContoller addAction:action];
    [alertContoller addAction:cancelAction];
    [alertContoller showWithSender:sender controller:nil animated:YES completion:nil];
}

- (void)addToMyFollowee{
    DSAVUser *currentUser = [DSAVUser currentUser];
    WEAKSELF
    if (self.userType == DSAddUserButtonTypeAdd) {// add a user
        
        [currentUser follow:self.follower.objectId andCallback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                weakSelf.userType = DSAddUserButtonTypeAdded;
                UIImage *buttonImage = [weakSelf getImageByType:weakSelf.userType];
                weakSelf.addButton.imageView.image = buttonImage;
            }else{
                [PSTAlertController presentDismissableAlertWithTitle:@"添加失败" message:@"网络不稳定,亲" controller:nil];
            }
        }];

    }else{   //remove a user
        [self.follower unfollow:self.follower.objectId andCallback:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                weakSelf.userType = DSAddUserButtonTypeAdd;
                UIImage *buttonImage = [weakSelf getImageByType:weakSelf.userType];
                weakSelf.addButton.imageView.image = buttonImage;
            }else{
                [JDStatusBarNotification showWithStatus:@"删除失败了，重试一下？" dismissAfter:1.5 styleName:JDStatusBarStyleWarning];
            }
        }];
        
        
    }

}

@end
