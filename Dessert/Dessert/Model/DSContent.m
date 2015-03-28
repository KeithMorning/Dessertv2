//
//  DSContent.m
//  Dessert
//
//  Created by keith on 15/3/23.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSContent.h"
#import "DSNetClient.h"
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

@end
@implementation DSContents




@end
