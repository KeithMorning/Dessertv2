//
//  DSRootNavigationController.m
//  Dessert
//
//  Created by keith on 6/28/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSRootNavigationController.h"

@interface DSRootNavigationController ()

@end

@implementation DSRootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)childViewControllerForStatusBarHidden{
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

@end
