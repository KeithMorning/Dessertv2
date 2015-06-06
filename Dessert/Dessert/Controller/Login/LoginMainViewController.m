//
//  LoginMainViewController.m
//  Dessert
//
//  Created by keith on 6/2/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "LoginMainViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface LoginMainViewController ()
{
   
    UITextField *currentTextField;
}
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@end

@implementation LoginMainViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {

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
#pragma mark - closeKeyboard
-(void)closeKeyBoardByTap:(UIGestureRecognizer *)sender{
    [self.view endEditing:YES];
}

#pragma mark - login
- (IBAction)loginClick:(id)sender {
    NSString *email = self.emailTextField.text;
    NSString *password = self.passWordField.text;
    
}


@end
