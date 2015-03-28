//
//  DSContent.h
//  Dessert
//
//  Created by keith on 15/3/23.
//  Copyright (c) 2015年 keith. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "DSUser.h"
@interface DSContent : NSObject
@property(nonatomic)NSString *text;
@property(nonatomic)NSString *title;
@property(nonatomic)DSUser *user;
@property(nonatomic)int authorid;
@property(nonatomic)int cid;
+ (void)RequestContent;
@end

@interface DSContents : DSContent
@property(nonatomic)NSArray *contents;

@end