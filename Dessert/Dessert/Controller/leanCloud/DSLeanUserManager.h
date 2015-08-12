//
//  DSLeanUserManager.h
//  Dessert
//
//  Created by keithxi on 8/12/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSAVUser.h"

typedef void(^DSAVUserResult)(NSArray *object, NSError *error);

@interface DSLeanUserManager : NSObject

+ (instancetype)manager;

- (NSArray *)getUserFollowees;
- (NSArray *)getUserFollowers;

- (void)updateUserFollowees:(DSAVUserResult)callBack;
- (void)updateUserFollowers:(DSAVUserResult)callBack;

- (NSArray *)findUserBySpelling:(NSString *)string;

- (BOOL)checkIsUserFollowees:(DSAVUser *)user;

@end
