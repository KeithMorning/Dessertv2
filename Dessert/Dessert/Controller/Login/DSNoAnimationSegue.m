//
//  DSNoAnimationSegue.m
//  Dessert
//
//  Created by keith on 6/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSNoAnimationSegue.h"

@implementation DSNoAnimationSegue
- (void)perform{
    UIViewController *sourceVc = [self sourceViewController];
    UIViewController *destinationVc = [self destinationViewController];
    [sourceVc.navigationController pushViewController:destinationVc animated:NO];
}
@end
