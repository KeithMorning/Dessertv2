//
//  DSLeanUserManager.m
//  Dessert
//
//  Created by keithxi on 8/12/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSLeanUserManager.h"

@interface DSLeanUserManager ()

@property (nonatomic,strong,readwrite) NSArray *userFollowees;
@property (nonatomic,strong,readwrite) NSDictionary *userFolloweeGroupBySpelling;
@property (nonatomic,strong,readwrite) NSArray *userFollweesIndex;

@property (nonatomic,strong,readwrite) NSArray *userFollowers;
@property (nonatomic,strong,readwrite) NSDictionary *userFollowersGroupBySpelling;
@property (nonatomic,strong,readwrite) NSArray *userFollwersIndex;


@end

@implementation DSLeanUserManager

+ (instancetype)manager {
    static DSLeanUserManager *leanUserManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        leanUserManager = [[DSLeanUserManager alloc] init];
    });
    return leanUserManager;
}

- (void)updateCurrentUserFollowees:(DSAVUserResultBlcok)callBack{
    [self updateUserFollowees:[DSAVUser currentUser].objectId complication:callBack];
}

- (void)updateCurrentUserFollowers:(DSAVUserResultBlcok)callBack{
    [self updateUserFollowers:[DSAVUser currentUser].objectId complication:callBack];
}

- (BOOL)checkIsUserFollowees:(DSAVUser *)user{
    if ([self.userFollowers containsObject:user]) {
        return YES;
    }
    return NO;
}



#pragma mark - Get User's followees

- (void)updateUserFollowees:(NSString *)userId complication:(DSAVUserResultBlcok)callBack{
    AVQuery *query = [AVUser followeeQuery:userId];
    [query includeKey:@"followee"];
    query.cachePolicy =kAVCachePolicyNetworkElseCache;
    query.maxCacheAge = HUGE_VAL;
    WEAKSELF
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            weakSelf.userFollowees = objects;
            weakSelf.userFolloweeGroupBySpelling = [weakSelf dictionaryUserByPinyin:objects];
            weakSelf.userFollweesIndex = [weakSelf indexKeyList:weakSelf.userFolloweeGroupBySpelling];
            callBack(YES,NULL);
        }else{
            callBack(NO,error);
        }
        
    }];
}

#pragma mark - Get User's followers
- (void)updateUserFollowers:(NSString *)userId complication:(DSAVUserResultBlcok)callBack{
    AVQuery *query = [AVUser followerQuery:userId];
    [query includeKey:@"follower"];
    query.cachePolicy =kAVCachePolicyNetworkElseCache;
    query.maxCacheAge = HUGE_VAL;
    WEAKSELF
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            weakSelf.userFollowers = objects;
            weakSelf.userFollowersGroupBySpelling = [weakSelf dictionaryUserByPinyin:objects];
            weakSelf.userFollwersIndex = [weakSelf indexKeyList:weakSelf.userFolloweeGroupBySpelling];
            callBack(YES,NULL);
        }else{
            callBack(NO,error);
        }
        
    }];
}

#pragma mark - contact list sortby Pinyin

- (NSDictionary *)dictionaryUserByPinyin:(NSArray *)userList{
    if (userList.count <=0) {
        return @{@"#":[NSMutableArray new]};
    }
    
    NSMutableDictionary *userGroupDict = [NSMutableDictionary new];
    NSMutableArray *allkeys = [NSString fromAtoZ];
    [allkeys addObject:@"#"];
    
    for (NSString *keystr in allkeys) {
        [userGroupDict setObject:[NSMutableArray new] forKey:keystr];
    }
    
    [userList enumerateObjectsUsingBlock:^(DSAVUser *obj, NSUInteger idx, BOOL *stop) {
        NSString *keystr = nil;
        NSMutableArray *dataArray = [NSMutableArray new];
        
        if (obj.pinyinName.length>1) {
            keystr = [obj.pinyinName substringToIndex:1];
            keystr = [keystr uppercaseString];
            if ([[userGroupDict allKeys]containsObject:keystr]) {
                dataArray = userGroupDict[keystr];
            }
            
            if (!dataArray) {
                dataArray = [NSMutableArray new];
            }
            [dataArray addObject:obj];
            [userGroupDict setObject:dataArray forKey:keystr];
        }
    }];
    
    for (NSString *str in allkeys) {
        NSMutableArray *tempArray = [userGroupDict objectForKey:str];
        if (tempArray.count <=0) {
            [userGroupDict removeObjectForKey:str];
        }
        if (tempArray.count>1) {
            [tempArray sortUsingComparator:^NSComparisonResult(DSAVUser *obj1, DSAVUser *obj2) {
                return [obj1.pinyinName compare: obj2.pinyinName];
            }];
        }
    }
    return userGroupDict;
}

- (NSArray *)indexKeyList:(NSDictionary *)userGroup{
    
    if (userGroup.count<=0) {
        return nil;
    }
    
    NSMutableArray *keyList = [NSMutableArray arrayWithArray:[userGroup allKeys]];
    if ([keyList containsObject:@"#"]) {
        [keyList removeObject:@"#"];
        [keyList addObject:@"#"];
    }
    
    [keyList sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    
    [keyList insertObject:UITableViewIndexSearch atIndex:0];
    return keyList;
}


@end
