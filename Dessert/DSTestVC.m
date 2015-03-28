//
//  DSTestVC.m
//  Dessert
//
//  Created by keith on 15/3/22.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSTestVC.h"
#import <MMMarkdown/MMMarkdown.h>
#import <hpple/TFHpple.h>
#import "HtmlMedia.h"
#import "DSContent.h"
#import "DSNetAPIManager.h"
@interface DSTestVC()
@property (weak, nonatomic) IBOutlet UILabel *LableTS;

@end
@implementation DSTestVC
-(void)viewDidLoad{
    [super viewDidLoad];
    NSError *error;
  //  NSString *blogs=[MMMarkdown HTMLStringWithMarkdown:@"![mvdashboard.jpg][1]\n\n  [1]: http://doc.keithmorning.com/usr/uploads/2015/03/4047483196.jpg\n\n## this is H2 \n **bold name**" error:&error];
    NSString *blog=[MMMarkdown HTMLStringWithMarkdown:@"![mvdashboard.jpg][1]\n\n   [1]: http://doc.keithmorning.com/usr/uploads/2015/03/4047483196.jpg\n## this is H2 \n **bold name** [good][2]\n\n  [2]:http://www.baidu.com" extensions:MMMarkdownExtensionsGitHubFlavored error:&error];
    //NSData *data=[blogs dataUsingEncoding:NSUTF8StringEncoding];
    HtmlMedia *media=[[HtmlMedia alloc]initWithString:blog showType:MediaShowTypeNone];
    self.LableTS.text= media.contentDisplay;
}
- (IBAction)logNetApi:(id)sender {
    [[DSNetAPIManager shareManager]getContetnsFromApi:@2 andBlock:^(id data, NSError *error) {
        DSContent *c=data[2];
        DebugLog(@"title:%@,content:%@ name:%@",c.title,c.text,c.user.name);
    }];
}
@end
