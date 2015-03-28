//
//  BlogBaseTableViewController.m
//  Dessert
//
//  Created by keith on 15/3/28.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "BlogBaseTableViewController.h"
#import "BlogBaseTableViewCell.h"
#import "DSContent.h"
@interface BlogBaseTableViewController ()
@property(nonatomic,strong)UIRefreshControl *myrefreshControl;
@property (nonatomic,strong)NSArray *BlogContents;
@end

@implementation BlogBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initlizeControl];
}
- (void)initlizeControl{
    _myrefreshControl = [[UIRefreshControl alloc]init];
    [_myrefreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = _myrefreshControl;
    [self.refreshControl beginRefreshing];
    [self reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataCompelete:) name:kBlogContentLoadCompelte object:nil];
}
-(void)reloadData{
    if (!self.refreshControl.refreshing) {
        [self.refreshControl beginRefreshing];
    }
   [DSContent RequestContent];
}
-(void)loadDataCompelete:(NSNotification *)notif{
    _BlogContents = [notif object];
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.BlogContents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifer = @"blogContentIndentifer";
    BlogBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (cell==nil) {
        cell = [[BlogBaseTableViewCell alloc]initWithItItentifier:cellIndentifer];
    }
    [cell setModelValue:_BlogContents[indexPath.row]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [BlogBaseTableViewCell cellHeight];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
