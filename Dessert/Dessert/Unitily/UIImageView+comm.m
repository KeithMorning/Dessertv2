//
//  UIImageView+comm.m
//  Dessert_v1
//
//  Created by fengxi on 15-1-7.
//  Copyright (c) 2015年 KeithMorning. All rights reserved.
//

#import "UIImageView+comm.h"
#import "UIColor+CreateMethods.h"
@implementation UIImageView (comm)
- (void)doCircleFrame{
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius=self.frame.size.width/2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}

- (void)doCircleFrameWithBorder{
    [self doCircleFrame];
     self.layer.borderWidth =1.0;
    self.layer.borderColor=[UIColor colorWithHex:@"#ffffff" alpha:1.0].CGColor;
}


@end
