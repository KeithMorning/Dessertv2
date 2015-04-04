//
//  BlogDetailView.m
//  Dessert
//
//  Created by keith on 15/3/29.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "BlogDetailView.h"
#import "MKToPainText.h"
#define KminiHeight 88.0f
@implementation BlogDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    [super awakeFromNib];
    [self updateConstraintsIfNeeded];
//    NSLog(@"%f",self.frame.size.height);
//    NSLog(@"%f ",self.userNameLab.frame.origin.y+self.userNameLab.frame.size.height);
//    NSLog(@"cellheight:%f",[self GetHeaderHight]);
}
-(instancetype)initWithFrame:(CGRect)frame withModle:(DSContent *)Model{
    NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"BlogDetailView" owner:self options:nil];
    self =[views lastObject];
    
    self.blogContentLab.text = [[MKToPainText new]MKToText: Model.text];
    frame.size.height = [self GetHeaderHight];
    self.frame = frame;
    //_timeLab.text = Model.createTime;
    return self;
    
}
-(CGFloat)GetHeaderHight{
    CGFloat lableHeigt = [DSTextCGSize TextSizeInLable:self.blogContentLab].height + 21 +8;//21 is username height 8 is top padding
    if (lableHeigt>=88) {
        return lableHeigt;
    }
    return KminiHeight;
}

@end
