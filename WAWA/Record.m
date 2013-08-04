//
//  Record.m
//  WAWA
//
//  Created by kevin on 13-6-28.
//  Copyright (c) 2013年 kevin. All rights reserved.
//

#import "Record.h"

@implementation Record

@synthesize rId= _rId;
@synthesize rItem= _rItem;
@synthesize rChoiceA= _rChoiceA;
@synthesize rChoiceB= _rChoiceB;
@synthesize rChoiceC= _rChoiceC;
@synthesize rChoiceD= _rChoiceD;
@synthesize rAnswer = _rAnswer;
@synthesize rExplanation = _rExplanation;
@synthesize rStatus = _rStatus;


- (NSString *)description
{
    NSString *str = [NSString stringWithFormat:@"\n序号:%d\n题目:%@\nA:%@\nB:%@\nC:%@\nD:%@\n答案:%@\n解释:%@\n标记状态:%d\n",
                     _rId,_rItem,_rChoiceA,_rChoiceB,_rChoiceC,_rChoiceD,_rAnswer,_rExplanation,_rStatus];
                     
    return str;
}
@end
