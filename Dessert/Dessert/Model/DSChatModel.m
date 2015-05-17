//
//  DSChatModel.m
//  Dessert
//
//  Created by keith on 5/16/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSChatModel.h"
#import "LeanCloudManger.h"

#import "UUMessage.h"
#import "UUMessageFrame.h"

@interface DSChatModel()

@property(nonatomic,strong) AVIMConversation *conversation;
@property(nonatomic,strong) NSMutableArray *typeMessages;

@end

@implementation DSChatModel

-(instancetype)initWithConversion:(AVIMConversation *)conversion{
    if (self=[super init]) {
        _conversation = conversion;
        _dataSource = [NSMutableArray array];
        _typeMessages = [NSMutableArray array];
        
    }
    return self;
}

- (UUMessageFrame *)messageFrameByDictionary:(NSDictionary *)dictionary{
    //TODO: next step
    return nil;
}


- (UUMessageFrame *)messageFrameByTypedMessage:(AVIMTypedMessage *)typedMessage
{
    return [self messageFrameByDictionary:[self messageDictionaryByAVIMTypedMessage:typedMessage]];
}

-(NSDictionary*)messageDictionaryByAVIMTypedMessage:(AVIMTypedMessage*)typedMessage{
    //TODO: next step
    return nil;
}

- (void)loadOldMessageItemsWithBlock:(void (^)(NSInteger))block{
    WEAKSELF
    [self.conversation queryMessagesBeforeId:nil timestamp:0 limit:10 callback:^(NSArray *typedMessages, NSError *error) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSMutableArray *filterMessages = [NSMutableArray new];
            for (AVIMMessage *typedMessage in typedMessages) {
                if ([typedMessage isKindOfClass:[AVIMTypedMessage class]]) {
                    [filterMessages addObject:typedMessage];
                }
            }
            NSMutableArray *messageFrames = [NSMutableArray new];
            for (AVIMTypedMessage *typedMessage in filterMessages) {
            //TODO: next step
              //  [messageFrames addObject:[weakSelf ]]
            }
        });
    }];
    
}

- (void)listenForNewMessageWithBlock:(dispatch_block_t)block
{
    
}

@end
