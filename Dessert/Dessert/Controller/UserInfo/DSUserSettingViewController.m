//
//  DSUserSettingViewController.m
//  Dessert
//
//  Created by keith on 15/4/11.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSUserSettingViewController.h"
#import "userInfoView.h"
#import "userExpericeTableViewCell.h"
#import "userSkillsTableViewCell.h"
#import "userActicleCellHeader.h"
#import "userSkillHeaderView.h"
#import "userExperienceHeaderView.h"
@interface DSUserSettingViewController ()

@end

@implementation DSUserSettingViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setHeaderView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Datatable delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 3;
            break;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section ==2) {
        userActicleCellHeader *acticleview = [[userActicleCellHeader alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 44)];
        return acticleview;
    }else if(section == 1){
        userSkillHeaderView *skillview = [[userSkillHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 44)];
        return skillview;
    }else if (section == 0){
        userExperienceHeaderView *experienceview = [[userExperienceHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 44)];
        return experienceview;
    }
    return nil;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
    userExpericeTableViewCell *cell = [[userExpericeTableViewCell alloc]initWithUserExperience:nil];
        return cell;
    }
    else if(indexPath.section == 1){
        userSkillsTableViewCell *cell = [[userSkillsTableViewCell alloc]initWithSkill:@"测试技能"];
        //cell.backgroundColor = [UIColor blueColor];
        return cell;
    }
    else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userOthercell"];
        return cell;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 44;
    }
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
#pragma mark- set the tableHeader
-(void)setHeaderView{
    userInfoView *view = [[userInfoView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, [userInfoView getHeaderHeight]) userHeaderModel:nil];
    self.tableView.tableHeaderView=view;
}


@end
