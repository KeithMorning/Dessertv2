//
//  DSNetAPIManager.h
//  Dessert
//
//  Created by keith on 15/3/27.
//  Copyright (c) 2015年 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSNetClient.h"
@interface DSNetAPIManager : NSObject
+(instancetype)shareManager;

-(void)getContetnsFromApi:(id)params andBlock:(void(^)(id data,NSError *error))block;
@end
