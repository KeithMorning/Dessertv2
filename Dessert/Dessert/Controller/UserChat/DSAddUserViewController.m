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

@interface DSAddUserViewController ()<UISearchBarDelegate>

@property (nonatomic,strong) NSArray *searchResult;
@property (nonatomic,strong) NSArray *isFriendFromSearch;
@property (nonatomic,strong) NSArray *followee;
@property (nonatomic,strong)UISearchBar *searchBar;

@end

@implementation DSAddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchResult = [NSArray new];
    [self setViewTitle];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(80, 0, kScreen_Width-100, 44)];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"昵称";
    //_searchBar.frame = CGRectMake(80, 0, kScreen_Width-100, 44);
    [self.navigationController.navigationBar addSubview:_searchBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_searchBar removeFromSuperview];
}
- (void)dealloc{
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
        if (_searchResult.count == 1) {
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        }else{
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        }
        DSAVUser *user = self.searchResult[indexPath.row];
        NSNumber *isFriendNumber = self.isFriendFromSearch[indexPath.row];
        
        DSAddUserButtonType type;
        if ([isFriendNumber isEqual:@1]) {
            type = DSAddUserButtonTypeAdded;
        }else{
            type = DSAddUserButtonTypeAdd;
        }
        
        DSAddUserTableViewCell *addUserCell = [tableView dequeueReusableCellWithIdentifier:@"DSAddUserTableViewCell" forIndexPath:indexPath];
        [addUserCell configCell:user buttonType:type];
        return addUserCell;
        
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

#pragma mark - UISearchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *inputname = searchBar.text;
    [self getSearchresultWithInput:inputname];
    [searchBar resignFirstResponder];
}

#pragma mark - get resource

- (void)getFollowerListDatasource:(void(^)()) compelete{
    DSAVUser *currentUser = [DSAVUser currentUser];
    [currentUser getFollowers:^(NSArray *objects, NSError *error) {
        _followee = objects;
        if (compelete) {
            compelete();
        }
    }];
}

- (void)getSearchresultWithInput:(NSString *)inputName{
    
    inputName = [inputName lowercaseString];
    
    WEAKSELF
    AVQuery *userNamequery = [AVQuery queryWithClassName:@"_User"];
    [userNamequery whereKey:@"username" containsString:inputName];
    
    AVQuery *pinYinquery = [AVQuery queryWithClassName:@"_User"];
    [pinYinquery whereKey:@"pinyinName" containsString:inputName];
    
    AVQuery *pingyinPrefix = [AVQuery queryWithClassName:@"_User"];
    [pingyinPrefix whereKey:@"pinyinName" hasPrefix:inputName];
    
    AVQuery *userlist = [AVQuery orQueryWithSubqueries:@[userNamequery,pinYinquery,pingyinPrefix]];
    [userlist findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _searchResult = objects;
            [weakSelf getFollowerListDatasource:^{
                
                if (_searchResult&&_searchResult.count>0) {
                    NSMutableArray *isFriends = [NSMutableArray arrayWithCapacity:_searchResult.count];
                    for (DSAVUser *user in _searchResult) {
                        NSNumber *isFriend;
                        if (_followee) {
                            if ([_followee containsObject:user]) {
                                isFriend = @1;
                            }else{
                                isFriend = @0;
                            }
                            [isFriends addObject:isFriend];
                            
                        }
                    }
                    _isFriendFromSearch = isFriends;
                }
                
                [weakSelf.tableView reloadData];
            }];
        }
    }];
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    //[self presentViewController:_searchVC animated:YES completion:nil];
}

@end
