//
//  LoginMainViewController.m
//  Dessert
//
//  Created by keith on 6/2/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "LoginMainViewController.h"
#import "DSAVUser.h"
#import "LoginCompeleteViewController.h"

@interface LoginMainViewController ()
{
    NSString *email;
    NSString *userName;
    NSString *password;
    UITextField *currentTextField;
}
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@end

@implementation LoginMainViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.needToCloseKeyboard = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _emailTextField.delegate = self;
    _passWordField.delegate = self;
    UIColor *color = [UIColor grayColor];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:15];
    _emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email/User" attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:font}];
    _passWordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PassWord" attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:font}];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - InterfaceOriengation
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
-(BOOL)shouldAutorotate{
    return NO;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return NO;
}



#pragma mark - textFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    currentTextField = textField;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    currentTextField = nil;
}


#pragma mark - login
- (IBAction)loginClick:(id)sender {
    [self.view endEditing:YES];
    if ([self checkStringFormat]) {
         [self performSegueWithIdentifier:@"DSLogincompleteIdentifie" sender:sender];
    }
    
}
- (IBAction)resetPassWordClick:(id)sender {
    [self.view endEditing:YES];
    [self performSegueWithIdentifier:@"DSResetPasswordIdentifier" sender:sender];
}
- (IBAction)registerClick:(id)sender {
    [self.view endEditing:YES];
    [self performSegueWithIdentifier:@"DSRegisterIdentifier" sender:sender];
}

#pragma makr - checkstring
- (BOOL)checkStringFormat{
    userName = self.emailTextField.text;
    password = self.passWordField.text;
    //TODO: check the email and password
    return YES;
}

#pragma mark - config the complete view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DSLogincompleteIdentifie"]) {
        LoginCompeleteViewController *loginCompeleteVc = segue.destinationViewController;
        loginCompeleteVc.userName = userName;
        loginCompeleteVc.passWord = password;
        loginCompeleteVc.loadingType = DSLoadTypeLogin;
        __weak LoginCompeleteViewController *weakVc = loginCompeleteVc;
        [loginCompeleteVc setFailedLoginBlock:^{
            [weakVc.navigationController popViewControllerAnimated:NO];
        }];
    }
}

@end
