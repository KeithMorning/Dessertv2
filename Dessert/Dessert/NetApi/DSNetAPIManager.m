//
//  DSNetAPIManager.m
//  Dessert
//
//  Created by keith on 15/3/27.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSNetAPIManager.h"
#import "ModelHeader.h"
#import <MJExtension/MJExtension.h>
@implementation DSNetAPIManager

+(instancetype)shareManager{
    static DSNetAPIManager *_shareClient =  nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shareClient = [[DSNetAPIManager alloc]init];});
    return _shareClient;
}

-(void)getContetnsFromApi:(id)params andBlock:(void(^)(id data,NSError *error))block{
    [[DSNetClient shareClient]requestJsonWithPath:Contents withParams:nil withMethodType:Get andBlock:^(id data, NSError *error) {
        
        NSDictionary *dict=[data objectForKey:@"Contents"];
        if (dict) {
            NSArray *contentDits= [data objectForKey:@"Contents"];
            NSMutableArray *contentArray=[NSMutableArray array];
           for (NSDictionary *dict in contentDits) {
                [contentArray addObject:[DSContent objectWithKeyValues:dict]];
                }
            block(contentArray,nil);
        }
        else{
            block(nil,error);
        }
    }];
    
}
@end
