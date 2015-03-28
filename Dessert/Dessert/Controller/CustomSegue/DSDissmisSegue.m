//
//  DSDissmisSegue.m
//  Dessert
//
//  Created by keith on 15/3/28.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSDissmisSegue.h"

@implementation DSDissmisSegue
- (instancetype) initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination{
    if (self=[super init]) {
        [self.sourceViewController dismissViewControllerAnimated:YES completion:nil];
    }
    return self;
}
@end
