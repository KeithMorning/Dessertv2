//
//  DSAVUser.h
//  Dessert
//
//  Created by keith on 6/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
#import <AVObject+Subclass.h>

@interface DSAVUser : AVUser<AVSubclassing>
@property (nonatomic,strong) AVFile *userImage;
@property (nonatomic,strong) NSString *pinyinName;
@end
