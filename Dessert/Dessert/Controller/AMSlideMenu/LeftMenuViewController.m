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
#import "AMLeftMenuTableViewCell.h"

#define cellHeight 60

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
    DSAVUser *user = [DSAVUser currentUser];
    header.userName = user.username;
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AMLeftMenuTableViewCell *cell = (AMLeftMenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];
    cell.backgroundColor = [UIColor colorWithHex:kDefaultBackgroundColor alpha:1.0];
    [self setLeftMenu:indexPath.row cell:cell];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithHex:kDefaultSelectedColor alpha:1.0];
    if (indexPath.row ==0) {
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    return cell;
}

- (void)setLeftMenu:(NSInteger)indexRow cell:(AMLeftMenuTableViewCell *)cell{
    switch (indexRow) {
        case 0:
            cell.leftTitle = @"社区";
            cell.leftImage = [UIImage imageNamed:@"community"];
            break;
        case 1:
            cell.leftTitle = @"关注";
            cell.leftImage = [UIImage imageNamed:@"following"];
            break;
        case 2:
            cell.leftTitle = @"消息";
            cell.leftImage = [UIImage imageNamed:@"message"];
            break;
        case 3:
            cell.leftTitle = @"退出";
            cell.leftImage = [UIImage imageNamed:@"logout"];
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<3) {
        [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
