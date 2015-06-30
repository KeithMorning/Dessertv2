//
//  DSAddUserTableViewCell.h
//  Dessert
//
//  Created by keith on 6/30/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DSAddUserButtonType) {
    DSAddUserButtonTypeAdd,
    DSAddUserButtonTypeAdded,
};
@interface DSAddUserTableViewCell : UITableViewCell

- (void)configCell:(NSString *)username userImage:(NSString *)url buttonType:(DSAddUserButtonType)type;

@end
