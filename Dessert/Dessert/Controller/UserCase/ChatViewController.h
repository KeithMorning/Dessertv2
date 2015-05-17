//
//  ChatViewController.h
//  Dessert
//
//  Created by keith on 5/16/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeanMessageManager.h"

@interface ChatViewController : UIViewController

- (instancetype)initWithConversation:(AVIMConversation*)conversation;
@property (nonatomic,strong) AVIMConversation *conversation;

@end
