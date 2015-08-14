//
//  DSLeanUserManager.h
//  Dessert
//
//  Created by keithxi on 8/12/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSAVUser.h"

typedef void(^DSAVUserResultBlcok)(BOOL success, NSError *error);

@interface DSLeanUserManager : NSObject

@property (nonatomic,strong,readonly) NSArray *userFollowees;
@property (nonatomic,strong,readonly) NSDictionary *userFolloweeGroupBySpelling;
@property (nonatomic,strong,readonly) NSArray *userFollweesIndex;

@property (nonatomic,strong,readonly) NSArray *userFollowers;
@property (nonatomic,strong,readonly) NSDictionary *userFollowersGroupBySpelling;
@property (nonatomic,strong,readonly) NSArray *userFollwersIndex;

+ (instancetype)manager;

- (void)updateCurrentUserFollowees:(DSAVUserResultBlcok)callBack;
- (void)updateCurrentUserFollowers:(DSAVUserResultBlcok)callBack;

- (BOOL)checkIsUserFollowees:(DSAVUser *)user;

@end
