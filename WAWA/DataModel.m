//
//  DataModel.m
//  WAWA
//
//  Created by xue on 13-7-3.
//  Copyright (c) 2013年 kevin. All rights reserved.
//

#import "DataModel.h"
#import "FMDatabase.h"
#import "AppUItility.h"
#import "Record.h"
#define kFileName @"exercise2000.db"
@implementation DataModel

@synthesize record;
@synthesize allRecords = _allRecords;


static FMDatabase *fmDatabase = nil;
static DataModel *dataModel = nil;

+ (DataModel *)shareDataModel
{
    @synchronized (self)
    {
        if (dataModel == nil) {
            dataModel = [[DataModel alloc] init];
        }
    }
    return dataModel;
}

- (id)init
{
    if (self = [super init]) {
        self.allRecords = [[NSMutableArray alloc] initWithCapacity:40];
        fmDatabase = [FMDatabase databaseWithPath:[self getFilePath:kFileName]];
        if (![fmDatabase open]) {
            [AppUItility showBoxWithMessage:@"数据库打开失败"];
        } 
    }
    return self;
}


//返回沙盒路径
- (NSString *)getFilePath:(NSString *)fileName
{
    NSArray *arr = [fileName componentsSeparatedByString:@"."];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[arr objectAtIndex:0] ofType:[arr objectAtIndex:1]];
    
    return filePath;
}




////获得所有的车型
//- (NSMutableArray *)fetchAllCheXing
//{
//    NSMutableArray *muArr = [[NSMutableArray alloc] initWithCapacity:10];
//    NSString *str = nil;
//    if ([fmDatabase open]) {
//        
//        FMResultSet *set = [fmDatabase executeQuery:@"select name from automobiles"];
//        
//        while ([set next]) {
//            
//            str = [set stringForColumn:@"name"];
//            
//            if ((NSNull *)str != [NSNull null] && ![str isEqualToString:@""]) {
//                
//                if ([muArr count] == 0) {
//                    [muArr addObject:str];
//                }
//                else {
//                    if (![muArr containsObject:str]) {
//                        [muArr addObject:str];
//                    }
//                }
//                
//            }
//        }
//
//    }
//    
//    [fmDatabase close];
//    return muArr;
//}
//
////获得所有的时间
//- (NSMutableArray *)fetchAllTime
//{
//    NSMutableArray *muArr = [[NSMutableArray alloc] initWithCapacity:3];
//    NSString *str = nil;
//    
//    
//    if ([fmDatabase open]) {
//        
//        FMResultSet *set = [fmDatabase executeQuery:@"select time from automobiles"];
//        
//        while ([set next]) {
//            
//            str = [set stringForColumn:@"time"];
//            
//            if ((NSNull *)str != [NSNull null] && ![str isEqualToString:@""]) {
//                
//                if ([muArr count] == 0) {
//                    [muArr addObject:str];
//                }
//                else {
//                    if (![muArr containsObject:str]) {
//                        [muArr addObject:str];
//                    }
//                }
//                
//            }
//        }
//
//    }
//    
//    [fmDatabase close];
//    return muArr;
//}



//获得所有记录
- (void)fetchAllRecords
{
    if ([fmDatabase open]) {
        FMResultSet *set = [fmDatabase executeQuery:@"select * from exercises"];
        while ([set next]) {
            Record *aRecord = [[Record alloc] init];
            aRecord.rId = [set intForColumn:@"id"];
            aRecord.rItem = [set stringForColumn:@"item"];
            aRecord.rChoiceA = [set stringForColumn:@"choiceA"];
            aRecord.rChoiceB = [set stringForColumn:@"choiceB"];
            aRecord.rChoiceC = [set stringForColumn:@"choiceC"];
            aRecord.rChoiceD = [set stringForColumn:@"choiceD"];
            aRecord.rAnswer = [set stringForColumn:@"answer"];
            aRecord.rStatus = [set intForColumn:@"status"];
            [_allRecords addObject:aRecord];
        }
    }
    [fmDatabase close];
}




/*
//根据输入的查询类型 返回数据 ---按类型先分类
- (NSMutableArray *)fetchRecordsWithSearchType:(NSString *)searchtype
{
    NSMutableArray *Records = [[NSMutableArray alloc] initWithCapacity:20];
    NSString *query = nil;
    if ([searchtype isEqualToString:@"售价"]) {
        self.currentSearchType = TypeOfPrice;
        query = [NSString stringWithFormat:@"select time, name, price from automobiles"];
    } else {
        if ([searchtype isEqualToString:@"卖出数量"]) {
            self.currentSearchType = TypeOfSCCount;
            query = [NSString stringWithFormat:@"select time, name, scCount from automobiles"];
        } else {
            self.currentSearchType = TypeOFKCCount;
            query = [NSString stringWithFormat:@"select time, name, kcCount from automobiles"];
        }
    }
    
    if ([fmDatabase open]) {

        FMResultSet *set = [fmDatabase executeQuery:query];
        while ([set next]) {
            while ([set next]) {
                Record *arecord = [[Record alloc] init];
                arecord.rTime = [set stringForColumn:@"time"];
                arecord.rName = [set stringForColumn:@"name"];
                arecord.rPrice = [set stringForColumn:@"price"];
                //arecord.rSCAmount = [set intForColumn:@"scCount"];
                //arecord.rKCAmount = [set intForColumn:@"kcCount"];
                [Records addObject:arecord];
            }
        }
    }
    [fmDatabase close];
    return Records;
}




- (NSMutableArray *)fetchDataWith:(NSString *)cheXing
                          andWith:(NSString *)qiShiTime
                          andWith:(NSString *)zhongZhiTime
                          andWith:(NSString *)searchType;
{
    
    NSMutableArray *wantData = [self fetchRecordsWithSearchType:searchType];
    NSPredicate  *pre = [NSPredicate predicateWithFormat:@"rName = %@ && rTime >= %@ && rTime <= %@ ",cheXing,qiShiTime,zhongZhiTime];
    [wantData filterUsingPredicate:pre];    
    _dataForDisplay = wantData;
    return wantData;

}
 */

@end




