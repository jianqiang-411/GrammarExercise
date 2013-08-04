//
//  Record.h
//  WAWA
//
//  Created by kevin on 13-6-28.
//  Copyright (c) 2013年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject
@property (assign, nonatomic) NSInteger rId;
@property (copy, nonatomic) NSString *rItem;
@property (copy, nonatomic) NSString *rChoiceA;
@property (copy, nonatomic) NSString *rChoiceB;
@property (copy, nonatomic) NSString *rChoiceC;
@property (copy, nonatomic) NSString *rChoiceD;
@property (copy, nonatomic) NSString *rAnswer;
@property (copy, nonatomic) NSString *rExplanation;
@property (assign, nonatomic) NSInteger rStatus;
@end
