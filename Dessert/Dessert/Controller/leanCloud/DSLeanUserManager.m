//
//  DSLeanUserManager.m
//  Dessert
//
//  Created by keithxi on 8/12/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSLeanUserManager.h"

@implementation DSLeanUserManager

+ (instancetype)manager {
    static DSLeanUserManager *leanUserManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        leanUserManager = [[DSLeanUserManager alloc] init];
    });
    return leanUserManager;
}

@end
