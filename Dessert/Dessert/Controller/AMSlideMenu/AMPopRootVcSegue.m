//
//  AMPopRootVcSegue.m
//  Dessert
//
//  Created by keith on 6/10/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "AMPopRootVcSegue.h"

@implementation AMPopRootVcSegue
- (void)perform{
    UIViewController *sourceVc = self.sourceViewController;
    [sourceVc.navigationController popToRootViewControllerAnimated:YES];
}
@end
