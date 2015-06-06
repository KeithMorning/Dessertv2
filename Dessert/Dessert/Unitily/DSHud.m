//
//  DSHub.m
//  Dessert
//
//  Created by keith on 6/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSHud.h"

@implementation DSHud
+(MBProgressHUD *)textHud:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.mode = MBProgressHUDModeText;
    return hud;
}

+(void)showMessage:(NSString *)message withView:(UIView *)view dealyHide:(NSTimeInterval)value{
    MBProgressHUD *hub = [DSHud textHud:view];
    hub.labelText=message;
    [hub show:YES];
    [hub hide:YES afterDelay:value];
}
@end
