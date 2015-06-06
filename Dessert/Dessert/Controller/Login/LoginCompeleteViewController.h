//
//  LoginCompeleteViewController.h
//  Dessert
//
//  Created by keith on 6/1/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginBaseViewController.h"

typedef NS_ENUM(NSUInteger, DSLoadType){
    DSLoadTypeRegister,
    DSLoadTypeLogin,
    DSLoadTypeSendEmail,
};

@interface LoginCompeleteViewController : LoginBaseViewController

@property (nonatomic)DSLoadType loadingType;
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *passWord;
@property (nonatomic,strong) NSString *email;

@end
