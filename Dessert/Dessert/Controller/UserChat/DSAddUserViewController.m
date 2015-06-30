//
//  DSAddUserViewController.m
//  Dessert
//
//  Created by keith on 6/29/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSAddUserViewController.h"
#import "DSAddUserTableViewCell.h"
#import "DSAVUser.h"

#define kNavigationTitle @"添加关注"

@interface DSAddUserViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (nonatomic,strong) NSArray *searchResult;

@end

@implementation DSAddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchResult = [NSArray new];
    [self setViewTitle];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)setViewTitle{
    self.title = kNavigationTitle;
}

#pragma mark - TableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _searchResult.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_searchResult.count>0) {
        DSAVUser *user = self.searchResult[indexPath.row];
        return ;
    }else{
        return nil;
    }
}

#pragma mark - UISearchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}

@end
