//
//  DSContent.m
//  Dessert
//
//  Created by keith on 15/3/23.
//  Copyright (c) 2015年 keith. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DSContent.h"
#import "DSNetAPIManager.h"
#import <MJExtension/MJExtension.h>
#import "APIUrl.h"
@implementation DSContent

-(DSContent *)initWithDict:(NSDictionary *)dict{
    DSContent *content = [DSContent objectWithKeyValues:dict];

    return content;
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"text":@"text",
             @"authorid":@"authorid",
             @"title":@"title",
             @"mail":@"DSUser.mail",
             @"uid":@"DSUser.uid",
             @"name":@"DSUser.name",
             @"cid":@"cid"
             };
}
/*
 get contents return contetns array
 */
+ (void)RequestContent{
    [[DSNetAPIManager shareManager]getContetnsFromApi:@10 andBlock:^(id data, NSError *error) {
        NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
        [center postNotificationName:kBlogContentLoadCompelte object:data];
    }];
}
@end
@implementation DSContents

@end
