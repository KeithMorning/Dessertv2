//
//  MainMenuViewController.m
//  Dessert
//
//  Created by keith on 15/4/7.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath{
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"Blog";
            break;
        case 1:
            identifier = @"User";
            break;
    }
    return identifier;
}

- (CGFloat)leftMenuWidth{
    return 250;
}

- (void)configureLeftMenuButton:(UIButton *)button{
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 25, 13);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"simpleMenuButton"] forState:UIControlStateNormal];
}

- (void) configureSlideLayer:(CALayer *)layer
{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 1;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:self.view.layer.bounds].CGPath;
}

- (UIViewAnimationOptions) openAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}

- (UIViewAnimationOptions) closeAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}
- (AMPrimaryMenu)primaryMenu
{
    return AMPrimaryMenuLeft;
}
- (BOOL)deepnessForLeftMenu
{
    return YES;
}

- (CGFloat)maxDarknessWhileLeftMenu
{
    return 0.5;
}
@end
