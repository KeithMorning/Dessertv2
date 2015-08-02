//
//  DSConversationListViewController.m
//  Dessert
//
//  Created by keith on 6/23/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSConversationListViewController.h"
#import "ODRefreshControl.h"
#import "LeanMessageManager.h"
#import "DSAVUser.h"

@interface DSConversationListViewController ()
@property (nonatomic,strong) ODRefreshControl *oDrefreshControl;
@property (nonatomic) BOOL isLoading;
@property (nonatomic,strong) NSArray *conversationList;
@end

@implementation DSConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [self configRefreshcontrol];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self configNavigationBar];
}

#pragma mark - refresh Control
- (void)configRefreshcontrol{
    _oDrefreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
    [_oDrefreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    _isLoading = NO;
    [_oDrefreshControl beginRefreshing];
    [self refreshData];
}

#pragma makr - refresh data
- (void)refreshData{
    [[LeanMessageManager manager]openSessionWithClientID:[DSAVUser currentUser].objectId completion:^(BOOL succeeded, NSError *error) {
        _isLoading = YES;
        if (succeeded) {
            [[LeanMessageManager manager] findRecentConversationsWithBlock:^(NSArray *objects, NSError *error) {
                self.conversationList= objects;
                [_oDrefreshControl endRefreshing];
                _isLoading = NO;
            }];
        }
    }];

}

#pragma mark - tableDatasource

#pragma mark - tableDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)configNavigationBar{
    
    [self.parentViewController.navigationItem setRightBarButtonItem:nil];
}

- (void)displaySearchView:(id)sender{

}

@end
