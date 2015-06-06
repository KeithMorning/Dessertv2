//
//  LoginBaseViewController.h
//  Dessert
//
//  Created by keith on 6/1/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^loginprocess)();

@protocol LoginBaseInput <NSObject>
@required
- (NSString *)nameLableText;

@end

@interface LoginBaseViewController : UIViewController

@property (nonatomic) BOOL needToCloseKeyboard;

@property (nonatomic) BOOL isLoading;// need to be set in viewdidAppear
@property (nonatomic,copy) loginprocess successLoginBlock;
@property (nonatomic,copy) loginprocess failedLoginBlock;

@property (weak,nonatomic) id<LoginBaseInput> delegate;

- (NSString *)nameLableText;

@end
