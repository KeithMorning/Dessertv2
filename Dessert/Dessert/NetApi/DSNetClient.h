//
//  DSNetClient.h
//  Dessert
//
//  Created by keith on 15/3/22.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
typedef enum{
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

@interface DSNetClient : AFHTTPRequestOperationManager
+(instancetype)shareClient;

-(void)requestJsonWithPath:(NSString *)apath withParams:(NSDictionary *)params withMethodType:(int)NetworkMethod andBlock:(void(^)(id data,NSError *error))block;
@end
