//
//  DSRegisterModel.m
//  Dessert
//
//  Created by keith on 6/22/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSRegisterModel.h"

@implementation DSRegisterModel

+ (void)registerModel{
    [DSFollowee registerSubclass];
    [DSAVUser registerSubclass];
}

@end
