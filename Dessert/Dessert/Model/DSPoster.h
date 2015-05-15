//
//  DSPoster.h
//  Dessert
//
//  Created by keith on 5/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSComment.h"
@interface DSPoster : NSObject

@property (nonatomic,copy)  NSString    *posterQuestion;
@property (nonatomic)       NSNumber   *posterId;
@property (nonatomic)       NSDate      *posterTime;
@property (nonatomic)       NSNumber   *posterUserId;
@property (nonatomic,copy)  NSString    *posterUser;
@property (nonatomic,copy)  NSString    *userRole;
@property (nonatomic)       NSNumber   *posterScore;
@property (nonatomic,strong)NSMutableArray/*DSComment*/   *posterComment;

@end
