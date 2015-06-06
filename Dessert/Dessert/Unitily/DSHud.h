//
//  DSHub.h
//  Dessert
//
//  Created by keith on 6/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>
@interface DSHud : NSObject

+(void)showMessage:(NSString *)message withView:(UIView *)view dealyHide:(NSTimeInterval)value;
@end
