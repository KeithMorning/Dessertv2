//
//  DSChatModel.h
//  Dessert
//
//  Created by keith on 5/16/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloudIM/AVOSCloudIM.h>

@interface DSChatModel : NSObject

@property(nonatomic,strong) NSMutableArray *dataSource;

- (instancetype)initWithConversion:(AVIMConversation *)conversion;

- (void)loadOldMessageItemsWithBlock:(void(^)(NSInteger count))block;

- (void)listenForNewMessageWithBlock:(dispatch_block_t)block;

@end
