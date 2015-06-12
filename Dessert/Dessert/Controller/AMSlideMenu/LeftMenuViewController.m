//
//  LeftMenuViewController.m
//  Dessert
//
//  Created by keith on 15/4/7.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "DSAVUser.h"
#import "AMleftMenuHeader.h"

@interface LeftMenuViewController ()
@property (strong, nonatomic) UITableView *myTableView;
@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && ![UIApplication sharedApplication].isStatusBarHidden)
//    {
//        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
//    }
//    
//    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
//        // The device is an iPhone or iPod touch.
//        //[self setFixedStatusBar];
//    }
   // [self setFixedStatusBar];
    [self setTableViewHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFixedStatusBar
{
    self.myTableView = self.tableView;
    
    self.view = [[UIView alloc] initWithFrame:self.view.bounds];
    self.view.backgroundColor = self.myTableView.backgroundColor;
    [self.view addSubview:self.myTableView];
    
   // UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAX(self.view.frame.size.width,self.view.frame.size.height), 20)];
   // statusBarView.backgroundColor = [UIColor clearColor];
   // [self.view addSubview:statusBarView];
}

- (void)setTableViewHeader{
    
    AMleftMenuHeader *header = [[AMleftMenuHeader alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 135)];
    self.tableView.tableHeaderView = header;
    self.view.backgroundColor = header.backgroundColor;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 3) {
//        //DSAVUser *user = [DSAVUser currentUser];
//        [DSAVUser logOut];
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
//}

@end
