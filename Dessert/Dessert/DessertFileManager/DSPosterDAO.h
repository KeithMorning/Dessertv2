//
//  DSPosterDAO.h
//  Dessert
//
//  Created by keith on 5/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSPoster.h"
@interface DSPosterDAO : NSObject

+(instancetype)shareManager;
-(NSString *) applicationDocumentsDirectoryFile;
-(void)createEditableCopyOfDatabaseIfNeed;

-(NSMutableArray *)read;
-(int) create:(DSPoster *)poster;
-(int) modify:(DSPoster *)poster;
-(int) remove:(DSPoster *)poster;

@end
