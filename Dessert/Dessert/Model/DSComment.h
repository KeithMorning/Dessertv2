//
//  DSComment.h
//  Dessert
//
//  Created by keith on 5/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSComment : NSObject

@property (nonatomic) NSNumber     *commentId;
@property (nonatomic) NSDate        *commentTime;
@property (nonatomic,copy)NSString  *commentUser;
@property (nonatomic) NSNumber     *commentOrder;
@property (nonatomic) NSNumber     *commentParentId;
@property (nonatomic,copy)NSString  *commentContent;
@property (nonatomic) NSNumber     *commentPosterId;

@end
