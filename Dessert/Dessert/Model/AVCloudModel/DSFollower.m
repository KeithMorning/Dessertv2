//
//  DSFollower.m
//  Dessert
//
//  Created by keith on 6/22/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSFollower.h"

@implementation DSFollower

- (instancetype)init{
    if (self = [super initWithClassName:@"_Follower"]) {
        
    }
    return self;
}

+ (NSString *)parseClassName{
    return @"DSFollower";
}

@end
