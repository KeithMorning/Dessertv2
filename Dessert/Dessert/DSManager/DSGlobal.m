//
//  DSGlobal.m
//  Dessert
//
//  Created by keithxi on 8/14/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSGlobal.h"
#import "AFNetworkReachabilityManager.h"

static BOOL isOnline;
static DSNetworkStatus networkStatus;
@interface DSGlobal()

@end

@implementation DSGlobal

#pragma mark - init

+ (void)globalInit
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [DSGlobal reachable];
}

+ (void)reachable{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                networkStatus = DSNetworkStatusOffline;
                isOnline = NO;
                DebugLog(@"Offline status...");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                networkStatus = DSNetworkStatusWWAN;
                isOnline = YES;
                DebugLog(@"3G network...");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                networkStatus = DSNetworkStatusWifi;
                isOnline = YES;
                DebugLog(@"Wifi network ...");
                break;
            case AFNetworkReachabilityStatusUnknown:
                networkStatus =DSNetworkStatusUnknonw;
                isOnline = NO;
                DebugLog(@"Unknow Network status..");
                break;
        }
    }];
}


#pragma networkstatus
+ (BOOL)getOnline{
    return  isOnline;
}

+ (DSNetworkStatus)getNetworkStatus{
    return networkStatus;
}

@end
