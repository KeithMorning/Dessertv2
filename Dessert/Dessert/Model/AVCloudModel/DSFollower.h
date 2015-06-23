//
//  DSFollower.h
//  Dessert
//
//  Created by keith on 6/22/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
#import <AVObject+Subclass.h>
#import "DSAVUser.h"

@interface DSFollower : AVObject<AVSubclassing>
@property(nonatomic,strong) DSAVUser *user;
@property (nonatomic,strong) DSAVUser *followee;
@end
