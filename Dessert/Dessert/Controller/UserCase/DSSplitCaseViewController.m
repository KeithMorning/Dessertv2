//
//  DSSplitCaseViewController.m
//  Dessert
//
//  Created by keith on 5/8/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSSplitCaseViewController.h"

@interface DSSplitCaseViewController ()

@end

@implementation DSSplitCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Better know you";
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didReceiveMemoryWarning)];
    button.tintColor = [UIColor whiteColor];
    //self.navigationController.navigationItem.rightBarButtonItems = @[button];
    self.navigationItem.rightBarButtonItems=@[button];
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
