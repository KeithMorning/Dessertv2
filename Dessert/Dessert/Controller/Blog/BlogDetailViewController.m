//
//  BlogDetailViewController.m
//  Dessert
//
//  Created by keith on 15/3/29.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "BlogDetailViewController.h"
#import "BlogDetailView.h"

@interface BlogDetailViewController ()
@property (nonatomic,strong) BlogDetailView *DetailView;
@end

@implementation BlogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTableHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -the tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    cell.textLabel.text = @"评论";
    cell.detailTextLabel.text = @"评论内容 ...";
    return cell;
}

- (void)setTableHeaderView{
    CGRect frame =CGRectMake(0, 0, kScreen_Width, 88);
    frame.size.height = [_DetailView GetHeaderHight];
    _DetailView = [[BlogDetailView alloc]initWithFrame:frame withModle:_ContentDetail];
    self.tableView.tableHeaderView = _DetailView;
   // NSLog(@"%f",self.tableView.tableHeaderView.frame.size.height);
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
