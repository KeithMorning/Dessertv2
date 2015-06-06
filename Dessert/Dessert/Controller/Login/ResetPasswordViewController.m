//
//  ResetPasswordViewController.m
//  Dessert
//
//  Created by keith on 6/2/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "DSAVUser.h"
@interface ResetPasswordViewController ()
{
    NSString *email;
}
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.needToCloseKeyboard = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendMailClick:(id)sender {
    [self.view endEditing:YES];
    [self.activityIndicator startAnimating];
    if([self checkStringFormat])
    {
         [DSAVUser requestPasswordResetForEmailInBackground:email block:^(BOOL succeeded, NSError *error) {
             if (succeeded) {
                 [self.activityIndicator stopAnimating];
                 [DSHud showMessage:@"发送成功" withView:self.view dealyHide:1.0];
                 [self performSelector:@selector(BackToMailPage) withObject:nil afterDelay:2.0];
                 return;
             }
             if (error) {
                 [self.activityIndicator stopAnimating];
                 [DSHud showMessage:error.localizedDescription withView:self.view dealyHide:1.0];
             }
         }];
    }
    
}

- (void)BackToMailPage{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backToLoginMain:(id)sender {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)checkStringFormat{
    email = self.emailTextField.text;
    //TODO: check the email format
    return YES;
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
