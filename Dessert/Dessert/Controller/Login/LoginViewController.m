//
//  LoginViewController.m
//  Dessert
//
//  Created by keith on 15/3/28.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)CheckPassWord{
    return YES;
}
- (IBAction)LoginClick:(id)sender {
    if ([self CheckPassWord]) {
        [self performSegueWithIdentifier:@"toBlogBaseSG" sender:nil];
    }
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
