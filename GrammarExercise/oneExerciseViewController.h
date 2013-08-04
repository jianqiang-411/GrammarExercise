//
//  oneExerciseViewController.h
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-12.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface oneExerciseViewController : UIViewController

@property (strong, nonatomic) UITextView *txtTitle;
@property (strong, nonatomic) UILabel *lblNumberOfItem;

@property (strong, nonatomic) UILabel *lblOptionA;
@property (strong, nonatomic) UILabel *lblOptionB;
@property (strong, nonatomic) UILabel *lblOptionC;
@property (strong, nonatomic) UILabel *lblOptionD;

@property (strong, nonatomic) UIButton *btnOptionA;
@property (strong, nonatomic) UIButton *btnOptionB;
@property (strong, nonatomic) UIButton *btnOptionC;
@property (strong, nonatomic) UIButton *btnOptionD;


@property (strong, nonatomic) UIButton *btnCommit;
@property (strong, nonatomic) UIButton *btnNext;
@property (strong, nonatomic) UIButton *btnSeeAnswer;

@property (assign, nonatomic) NSInteger currentGroup;
@property (assign, nonatomic) NSInteger currentItem;

- (void)creatUI;
- (void)fillContent;

@end
