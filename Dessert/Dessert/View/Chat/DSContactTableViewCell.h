//
//  DSContactTableViewCell.h
//  Dessert
//
//  Created by keith on 6/23/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSAVUser.h"

@interface DSContactTableViewCell : UITableViewCell
- (void)configCellWithUser:(DSAVUser*)user;
@end
