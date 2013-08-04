//
//  DataModel.h
//  WAWA
//
//  Created by xue on 13-7-3.
//  Copyright (c) 2013年 kevin. All rights reserved.
//



#import <Foundation/Foundation.h>
@class FMDatabase;
@class Record;

@interface DataModel : NSObject



@property (strong, nonatomic) Record *record;
@property (retain, nonatomic) NSMutableArray *allRecords;
//@property (strong, nonatomic) NSFileManager *fm;
//@property (copy, nonatomic) NSString *currentFileName;


+ (DataModel *)shareDataModel;
+ (NSString *)getDocumentPath;


- (void)fetchAllRecords;//所有Records
- (NSString *)getFilePath:(NSString *)fileName;

//- (NSMutableArray *)fetchAllCheXing;
//- (NSMutableArray *)fetchAllTime;
//- (NSMutableArray *)fetchDataWith:(NSString *)cheXing
//                          andWith:(NSString *)qiShiTime
//                          andWith:(NSString *)zhongZhiTime
//                          andWith:(NSString *)searchType;

@end
