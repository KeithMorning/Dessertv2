//
//  UserCaseViewController.m
//  Dessert
//
//  Created by keith on 4/19/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "UserCaseViewController.h"

@interface UserCaseViewController ()

@end

@implementation UserCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHex:@"#153749" alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"#244156" alpha:1.0];
    self.title = @"My Case";
    UIColor * color = [UIColor whiteColor];

    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];

    self.navigationController.navigationBar.titleTextAttributes = dict;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
