//
//  DoctorActicleViewController.m
//  Dessert
//
//  Created by keith on 4/19/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DoctorActicleViewController.h"
#import "ChatViewController.h"
#import "UserCaseViewController.h"

@interface DoctorActicleViewController ()
@property (nonatomic,strong) UserCaseViewController *detailVc;
@end

@implementation DoctorActicleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"#E1F0F7" alpha:1.0];
    self.tableView.backgroundColor = [UIColor colorWithHex:@"#efefef" alpha:1.0];
    UINavigationController *navController = (UINavigationController*)[self.splitViewController.viewControllers lastObject];
    self.detailVc = (UserCaseViewController *)[navController.viewControllers lastObject];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (cell==nil) {
        cell = [[UITableViewCell alloc]init];
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrowUp.png"]];
        imageview.frame = CGRectMake(8, 8, 30, 30);
        UILabel *voteNum = [[UILabel alloc]initWithFrame:CGRectMake(40, 13, 20, 20)];
        voteNum.text = @"23";
        UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(65, 8, 200, 80)];
        content.numberOfLines =0 ;
        content.text = @"In this case you should fix your heart,Or some case can be show";
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(65, 88, 200, 20)];
        name.numberOfLines =0 ;
        name.text = @"By doctor Mr.Li Just Now";
        [cell addSubview:imageview];
        [cell addSubview:voteNum];
        [cell addSubview:content];
        [cell addSubview:name];
        cell.backgroundColor = [UIColor colorWithHex:@"#efefef"  alpha:1.0];
        cell.contentView.backgroundColor = cell.backgroundColor;
        
    }
    [cell setAutoresizesSubviews:NO];
    // Configure the cell...
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 130;
}




- (void)openSessionByClientId:(NSString*)clientId navigationToIMWithTargetClientIDs:(NSArray *)clientIDs {
    WEAKSELF
    [[LeanMessageManager manager] openSessionWithClientID:clientId completion:^(BOOL succeeded, NSError *error) {
        if(!error){
            ConversationType type;
            if(clientIDs.count>1){
                type=ConversationTypeGroup;
            }else{
                type=ConversationTypeOneToOne;
            }
        }else{
            NSLog(@"error=%@",error);
        }
    }];
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
