//
//  ChatViewController.h
//  Dessert
//
//  Created by keith on 5/16/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeanCloudManger.h"
#import <AVOSCloudIM/AVOSCloudIM.h>

extern NSString *const kChatAVIMConversation;

@interface ChatViewController : UIViewController

-(void)configChatViewController:(NSDictionary *)parameter;/*kchatAVIMConversation require*/

@end
