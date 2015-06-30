//
//  RegisterViewController.m
//  Dessert
//
//  Created by keith on 6/2/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginCompeleteViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface RegisterViewController ()
{
    NSString *userName;
    NSString *email;
    NSString *password;
    NSString *pinyinName;
    BOOL stringFormatCheck;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.needToCloseKeyboard = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToLoginMainClick:(id)sender {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)registerClick:(id)sender {
    [self.view endEditing:YES];
    
    userName = self.userNameTextField.text;
    email    = self.emailTextField.text;
    password = self.passWordTextField.text;
    stringFormatCheck = YES;
    
    //TODO: check the user,email,password
    if (stringFormatCheck) {
        [self performSegueWithIdentifier:@"DSLogincompleteIdentifie" sender:sender];
    }else{
        [DSHud showMessage:@"请检查输入" withView:self.view dealyHide:1.0];
    }
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DSLogincompleteIdentifie"]) {
        LoginCompeleteViewController *loginProcessVc = segue.destinationViewController;
        loginProcessVc.userName = userName;
        loginProcessVc.passWord = password;
        loginProcessVc.email    = email;
        loginProcessVc.loadingType = DSLoadTypeRegister;
        __weak LoginCompeleteViewController *weakvc = loginProcessVc;
        [loginProcessVc setFailedLoginBlock:^{
            [weakvc.navigationController popViewControllerAnimated:NO];
        }];
        
    }
}

@end
