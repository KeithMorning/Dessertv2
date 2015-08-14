//
//  DSManager.m
//  Dessert
//
//  Created by keithxi on 8/13/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSManager.h"

@implementation DSManager

+ (instancetype)manager {
    static DSManager *dsManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dsManager = [[DSManager alloc] init];
    });
    return dsManager;
}

- (void)managerInit{
    
}

@end
