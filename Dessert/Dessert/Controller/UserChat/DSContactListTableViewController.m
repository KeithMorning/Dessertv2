//
//  DSContactListTableViewController.m
//  Dessert
//
//  Created by keith on 6/23/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSContactListTableViewController.h"
#import "ODRefreshControl.h"
#import "DSAVUser.h"
#import <AVOSCloud/AVOSCloud.h>
#import "JDStatusBarNotification.h"
#import "DSContactTableViewCell.h"
#import "UIColor+CreateMethods.h"
#import "DSAddUserViewController.h"
#import "LeanMessageManager.h"
#import "ChatViewController.h"
#import "DSLeanUserManager.h"

@interface DSContactListTableViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>
@property (nonatomic,strong) ODRefreshControl *oDrefreshControl;
@property (nonatomic) BOOL isLoading;
@property (nonatomic,strong) NSDictionary *userGoupDict;
@property (nonatomic,strong) NSArray *indexList;

@end

@implementation DSContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    _oDrefreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
    [_oDrefreshControl addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventValueChanged];
    _isLoading = NO;
    [_oDrefreshControl beginRefreshing];
    [self refreshData:nil];
    
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexColor = [UIColor colorWithHex:@"#666666" alpha:1.0];
    
    self.tableView.tableFooterView = [[UIView alloc] init];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configNavigationBar];
    [self refreshUserList];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}


#pragma mark - Custom UI
- (void)configNavigationBar{
    
    UIBarButtonItem *searchButtonItem= [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(displaySearchView:)];
    searchButtonItem.tintColor = [UIColor colorWithHex:KNavigationButtonItemTintColor alpha:1.0];
    [self.parentViewController.navigationItem setRightBarButtonItem:searchButtonItem animated:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - search Bar action
- (void)displaySearchView:(id)sender{
    [self performSegueWithIdentifier:@"SMAddUserSegueIdentifier" sender:self];
}
#pragma mark - DataSource
- (void)refreshData:(id)sender{
    [self refreshUserList];
    
}

- (void)refreshUserList{
    _isLoading = YES;
    DSAVUser *currentUser = [DSAVUser currentUser];
    if (currentUser) {
        WEAKSELF
        [[DSLeanUserManager manager] updateCurrentUserFollowees:^(BOOL success, NSError *error) {
            [weakSelf.oDrefreshControl endRefreshing];
            _isLoading = NO;
            if (success) {
                weakSelf.userGoupDict = [[DSLeanUserManager manager] userFolloweeGroupBySpelling];
                weakSelf.indexList    = [[DSLeanUserManager manager] userFollweesIndex];
            }else{
              [JDStatusBarNotification showWithStatus:@"刷新失败" dismissAfter:1.5 styleName:JDStatusBarStyleWarning];
            }
        }];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.userGoupDict.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _indexList[section+1];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat height = [self tableView:tableView heightForHeaderInSection:section];
    
    UIView *headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, height)];
    headerview.backgroundColor = [UIColor colorWithHex:@"#e5e5e5" alpha:1.0];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 10, height)];
    lable.font = [UIFont systemFontOfSize:12];
    lable.text = [self tableView:tableView titleForHeaderInSection:section];
    lable.textColor = [UIColor colorWithHex:@"#999999" alpha:1.0];
    [headerview addSubview:lable];
    
    return headerview;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    NSArray *datalist = self.userGoupDict[self.indexList[section+1]];
    return datalist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSContactTableViewCell *cell = (DSContactTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"DSContactCell" forIndexPath:indexPath];
    
    NSArray *datalist = self.userGoupDict[self.indexList[indexPath.section+1]];
    
    DSAVUser *tempuser = [datalist objectAtIndex:indexPath.row];
    if (tempuser) {
        [cell configCellWithUser:tempuser];
    }
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.indexList;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    if (index == 0) {
        [self.tableView setContentOffset:CGPointZero animated:YES];
        return NSNotFound;
    }
    return index;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *datalist = self.userGoupDict[self.indexList[indexPath.section+1]];
    DSAVUser *user = [datalist objectAtIndex:indexPath.row];
    WEAKSELF
    [[LeanMessageManager manager] openSessionWithClientID:[DSAVUser currentUser].objectId completion:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [weakSelf createConversationOneToOne:user];
        }else{//TODO: offline into
            [weakSelf createConversationOneToOne:user];
        }
    }];
}
#pragma mark - Conversation
- (void)createConversationOneToOne:(DSAVUser *)user{
    DSAVUser *selfUser =[DSAVUser currentUser];
    NSArray *array = @[selfUser,user];
    WEAKSELF
    [[LeanMessageManager manager] createConversationsWithUsers:array conversationType:ConversationTypeOneToOne completion:^(AVIMConversation *conversation, NSError *error) {
        [weakSelf initChatContoller:conversation];
    }];
}

- (void)initChatContoller:(AVIMConversation *)conversation{
    ChatViewController *chatVc =[[ChatViewController alloc] initWithConversation:conversation];
    [self.navigationController pushViewController:chatVc animated:YES];
    
}


#pragma mark - Search bar Delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar insertBGColor:[UIColor colorWithHex:kDefaultBackgroundColor]];
    return YES;
}

@end
