//
//  MKToPainText.m
//  Dessert
//
//  Created by keith on 15/3/23.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "MKToPainText.h"
#import <MMMarkdown/MMMarkdown.h>
#import "HtmlMedia.h"
@implementation MKToPainText
-(NSString *)MKToText:(NSString *)MarkdownString{
    NSError *error;
    NSString *htmlString = [MMMarkdown HTMLStringWithMarkdown:MarkdownString extensions:MMMarkdownExtensionsGitHubFlavored error:&error];
    HtmlMedia *content = [[HtmlMedia alloc]initWithString:htmlString showType:MediaShowTypeNone];
    return content.contentDisplay;
}
@end
