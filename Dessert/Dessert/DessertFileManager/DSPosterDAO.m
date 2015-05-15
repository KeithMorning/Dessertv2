//
//  DSPosterDAO.m
//  Dessert
//
//  Created by keith on 5/6/15.
//  Copyright (c) 2015 keith. All rights reserved.
//

#import "DSPosterDAO.h"
#import "DSFileManager.h"
#import "DSPoster.h"
#import "DSComment.h"
#import <MJExtension/MJExtension.h>
static DSPosterDAO *shareManager;
@implementation DSPosterDAO

+(instancetype)shareManager{
    
    static dispatch_once_t once_taken;
    dispatch_once(&once_taken, ^{
        shareManager = [[self alloc]init];
        [shareManager createEditableCopyOfDatabaseIfNeed];
    });
    return shareManager;
}

-(NSString *)applicationDocumentsDirectoryFile{
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"aticlelist.plist"];
    return path;
}

-(void)createEditableCopyOfDatabaseIfNeed{
    DSFileManager *fileManager = (DSFileManager *)[DSFileManager defaultManager];
    NSString *writableDBPath = [self applicationDocumentsDirectoryFile];
    BOOL dbExists = [fileManager fileExistsAtPath:writableDBPath];
    if (!dbExists) {
        NSString *defaultDBPath = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:@"aticlelist.plist"];
        NSError *error;
        BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success) {
            NSLog(@"write to %@ from %@ failed!",writableDBPath,defaultDBPath);
        }
    }
    
}

-(NSMutableArray *)read{
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:path];
    NSMutableArray *listData = [NSMutableArray new];
    
    [DSPoster setupObjectClassInArray:^NSDictionary *{
        return @{@"posterComment":@"DSComment"};
    }];
    
    for (NSDictionary *dict in array) {
        DSPoster *poster = [DSPoster objectWithKeyValues:dict];
        [listData addObject:poster];
    }
    return listData;
}

-(int)remove:(DSPoster *)poster{
    //TODO: todo
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:path];
    for(NSDictionary *dict in array){
        NSNumber *posterId = [dict objectForKey:@"posterId"];
        if (posterId==poster.posterId) {
            [array removeObject:dict];
            [array writeToFile:path atomically:YES];
            break;
        }
    }
    return 0;
}

-(int)modify:(DSPoster *)poster{
    //TODO: todo
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:path];
    for (int i=0; i<array.count; i++) {
        NSDictionary *dict = array[i];
        NSNumber *posterId = [dict objectForKey:@"posterId"];
        if (posterId==poster.posterId) {
            array[i] = poster.keyValues;
            [array writeToFile:path atomically:YES];
            break;
        }
        
    }
    return 0;
}

-(int)create:(DSPoster *)poster{
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:path];
    NSDictionary *dict = poster.keyValues;
    
    [array addObject:dict];
    [array writeToFile:path atomically:YES];
    return 0;
}

@end
