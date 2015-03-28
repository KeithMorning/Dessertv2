//
//  DSNetClient.m
//  Dessert
//
//  Created by keith on 15/3/22.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import "DSNetClient.h"

@implementation DSNetClient
+(instancetype)shareClient{
    static DSNetClient *_shareClient =  nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shareClient = [[DSNetClient alloc]initWithBaseURL:[NSURL URLWithString:DSNetAPIBaseURLString]];
    });
    return _shareClient;
}

-(void)requestJsonWithPath:(NSString *)apath withParams:(NSDictionary *)params withMethodType:(int)NetworkMethod andBlock:(void (^)(id, NSError *))block{
    DebugLog(@"\n========request=======\n%@:\n%@",apath,params);
    //log the request
    switch (NetworkMethod) {
        case Get:
            [self GET:apath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                DebugLog(@"\n=========response============\n%@\%@",apath,params);
                //id error=[self han]
                block(responseObject,nil);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                DebugLog(@"\n=========response============\n%@\%@",apath,params);
                block(nil,error);
            }];
            break;
    }

}
@end
