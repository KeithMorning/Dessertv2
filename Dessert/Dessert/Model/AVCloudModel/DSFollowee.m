//
//  DSFollowee.m
//  Dessert
//
//  Created by keith on 6/22/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSFollowee.h"


@implementation DSFollowee
@dynamic user,followee;

+ (instancetype)initModel{
    
    return [self objectWithClassName:@"DSFollowee"];
   
}

+ (NSString *)parseClassName{
    return @"DSFollowee";
}
@end
