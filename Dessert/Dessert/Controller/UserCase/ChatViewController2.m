//
//  ChatViewController.m
//  Dessert
//
//  Created by keith on 5/16/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "ChatViewController.h"
#import "UUInputFunctionView.h"
#import "MJRefresh.h"
#import "UUMessage.h"
#import "DSChatModel.h"
#import "UUMessageFrame.h"
#import "UUMessageCell.h"


@interface ChatViewController ()<UUInputFunctionViewDelegate,UUMessageCellDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)MJRefreshFooterView *head;
@property (nonatomic,strong)DSChatModel *chatModel;

@property (weak, nonatomic) IBOutlet UITableView *chatTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic,strong) AVIMConversation *conversation;

@property (nonatomic,strong) UUInputFunctionView *IFView;


@end

NSString *const kChatAVIMConversation = @"kChatAVIMConversation";

@implementation ChatViewController

-(void)configChatViewController:(NSDictionary *)parameter{
    if ([parameter objectForKey:kChatAVIMConversation]) {
        self.conversation = [parameter objectForKey:kChatAVIMConversation];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBar];
    [self initIFView];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //add notification
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tableViewSrollToBottom) name:UIKeyboardDidShowNotification object:nil];
    WEAKSELF
    [self.chatModel listenForNewMessageWithBlock:^{
      //  [weakSelf finishSendMessage];
    }];
}

- (void)initBar{
    self.view.backgroundColor = [UIColor colorWithHex:@"#153749" alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"#244156" alpha:1.0];
    self.title = @"My Case";
    UIColor * color = [UIColor whiteColor];
    
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
}

- (void)initIFView{
    self.IFView = [[UUInputFunctionView alloc]initWithSuperVC:self];
    self.IFView.delegate = self;
    [self.view addSubview:self.IFView];
    
    if (self.conversation) {
        self.chatModel = [[DSChatModel alloc]initWithConversion:self.conversation];
    }else{
        NSLog(@"conversation is nil");
    }
    
    WEAKSELF
    [self.chatModel loadOldMessageItemsWithBlock:^(NSInteger count) {
        [weakSelf.chatTableView reloadData];
        [weakSelf tableViewSrollToBottom];
    }];
    
    
}




#pragma mark tableview scroll bottom
- (void)tableViewSrollToBottom{
    if (self.chatModel.dataSource.count == 0) {
        return;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.chatModel.dataSource.count inSection:0];
    [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end
