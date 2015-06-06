//
//  LoginCompeleteViewController.m
//  Dessert
//
//  Created by keith on 6/1/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "LoginCompeleteViewController.h"
#import "DSAVUser.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface LoginCompeleteViewController ()

@end

@implementation LoginCompeleteViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
       
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.isLoading = YES;
    [self handleLoginProcess];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - login handle
- (void)handleLoginProcess{
    switch (self.loadingType) {
        case DSLoadTypeRegister:
            [self registerNewUser];
            break;
        case DSLoadTypeLogin:
            [self login];
        default:
            break;
    }
}

//register
- (void)registerNewUser{
    DSAVUser *user = [DSAVUser user];
    user.email = self.email;
    user.username = self.userName;
    user.password = self.passWord;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (succeeded) {
                [DSHud showMessage:@"注册成功" withView:self.view dealyHide:1.0];
                [self performSegueWithIdentifier:@"DSMainMenuIdentifier" sender:nil];
            }
            else{
                if (self.failedLoginBlock) {
                    NSString *stringError = error.localizedDescription;
                    [DSHud showMessage:stringError withView:self.view dealyHide:1.0];
                    [self performSelector:@selector(delayUnloading) withObject:nil afterDelay:2.0];
                }
            }
        });
       
    }];
}

-(void)login{
    [DSAVUser logInWithUsernameInBackground:self.userName password:self.passWord block:^(AVUser *user, NSError *error) {
        if (error) {
            NSString *stringError = error.localizedDescription;
            [DSHud showMessage:stringError withView:self.view dealyHide:1.0];
            [self performSelector:@selector(delayUnloading) withObject:nil afterDelay:2.0];
        }else{
             [self performSegueWithIdentifier:@"DSMainMenuIdentifier" sender:nil];
        }
    }];
}


- (void)delayUnloading{
    self.isLoading = NO;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
