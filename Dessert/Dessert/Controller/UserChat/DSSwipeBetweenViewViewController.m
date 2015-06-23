//
//  DSSwipeBetweenViewViewController.m
//  Dessert
//
//  Created by keith on 6/23/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSSwipeBetweenViewViewController.h"
#import "DSContactListTableViewController.h"
#import "DSConversationListViewController.h"

@interface DSSwipeBetweenViewViewController ()

@end

@implementation DSSwipeBetweenViewViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.buttonText = @[@"消息",@"通讯录"];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        DSContactListTableViewController *contactVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"DSContactListTableViewController"];
        DSConversationListViewController *conversationVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"DSConversationListViewController"];
        self.viewControllerArray = [NSMutableArray new];
        [self.viewControllerArray addObjectsFromArray:@[contactVC,conversationVC]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
