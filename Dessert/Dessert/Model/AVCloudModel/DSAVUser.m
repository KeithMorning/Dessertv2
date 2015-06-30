//
//  DSAVUser.m
//  Dessert
//
//  Created by keith on 6/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSAVUser.h"

@implementation DSAVUser
@dynamic userImage,pinyinName;
+(instancetype)user{
    return [super user];
}

+(NSString *)parseClassName{
    return @"_User";
}

@end
