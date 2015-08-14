//
//  DSGlobal.h
//  Dessert
//
//  Created by keithxi on 8/14/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DSNetworkStatus) {
    DSNetworkStatusUnknonw,
    DSNetworkStatusWWAN,
    DSNetworkStatusWifi,
    DSNetworkStatusOffline,
};

@interface DSGlobal : NSObject

#pragma mark - init
+ (void)globalInit;

#pragma networkstatus
+ (BOOL)getOnline;
+ (DSNetworkStatus)getNetworkStatus;
@end
