//
//  oneExerciseViewController.m
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-12.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import "oneExerciseViewController.h"
#import "exListViewController.h"
#import "Define.h"
#import "DataModel.h"
#import "Record.h"
#import "UIViewController+MJPopupViewController.h"
#import "popResult.h"


@interface oneExerciseViewController ()
@property (retain, nonatomic) NSMutableArray *records;
@end

@implementation oneExerciseViewController

@synthesize records = _records;

@synthesize txtTitle = _txtTitle;
@synthesize lblNumberOfItem = _lblNumberOfItem;

@synthesize lblOptionA = _lblOptionA;
@synthesize lblOptionB = _lblOptionB;
@synthesize lblOptionC = _lblOptionC;
@synthesize lblOptionD = _lblOptionD;

@synthesize btnOptionA = _btnOptionA;
@synthesize btnOptionB = _btnOptionB;
@synthesize btnOptionC = _btnOptionC;
@synthesize btnOptionD = _btnOptionD;


@synthesize btnCommit = _btnCommit;
@synthesize btnNext = _btnNext;
@synthesize btnSeeAnswer = _btnSeeAnswer;

@synthesize currentGroup = _currentGroup;
@synthesize currentItem = _currentItem;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickedNext:) name:@"nextQuestion" object:nil];
        self.navigationItem.title = @"挑战第一组习题";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toExlist)];

        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgti.png"]];
        
    }
    return self;
}

-(void)toExlist
{
    
    exListViewController *exlist = [[exListViewController alloc] init];
    [self.navigationController pushViewController:exlist animated:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"----%f,=====%f",KSCREENWIDTH,KSCREENHEIGHT);
    
    [self creatUI];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.currentGroup = 0;
    self.currentItem = 0;
    [self fillContent];
}

- (void)fillContent
{
    self.records = [DataModel shareDataModel].allRecords;

    Record *aRecord = [[Record alloc] init];
    aRecord = [_records objectAtIndex:_currentItem];
    
    if (_currentItem+1 < 10) {
        _lblNumberOfItem.text = [NSString stringWithFormat:@"0%d.",_currentItem+1];
    } else {
        _lblNumberOfItem.text = [NSString stringWithFormat:@"%d.",_currentItem+1];
    }

    
    NSRange range = [aRecord.rItem rangeOfString:@"="];
    
    if (range.location != NSNotFound) {
        
        NSArray *arrTitle = [aRecord.rItem componentsSeparatedByString:@"="];
        
       
        _txtTitle.text = [arrTitle objectAtIndex:0];
               
        for (int i = 1;  i < [arrTitle count]; i++ ) {
            [_txtTitle insertText:@"\n"];
            NSString *str = [arrTitle objectAtIndex:i];
            [_txtTitle insertText:str];
        }
    } else {
        _txtTitle.text = [NSString stringWithFormat:@"%@",aRecord.rItem];
    
    }
    
    _lblOptionA.text = aRecord.rChoiceA;
    _lblOptionB.text = aRecord.rChoiceB;
    _lblOptionC.text = aRecord.rChoiceC;
    _lblOptionD.text = aRecord.rChoiceD;
   
}


- (void)creatUI
{
    //<------------------------题目TextView----------------------------->
    self.lblNumberOfItem = [[UILabel alloc] initWithFrame:CGRectMake(70, 66, 40, 40)];
    [_lblNumberOfItem setFont:[UIFont systemFontOfSize:25]];
    [_lblNumberOfItem setTextColor:[UIColor whiteColor]];
    _lblNumberOfItem.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_lblNumberOfItem];
    
    self.txtTitle = [[UITextView alloc] initWithFrame:CGRectMake(110, 66, 593, 190)];
    [_txtTitle setFont:[UIFont systemFontOfSize:30]];
    [_txtTitle setTextColor:[UIColor whiteColor]];
    _txtTitle.userInteractionEnabled = NO;
    _txtTitle.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_txtTitle];
    
    
    //<------------------------4个选项UILabel----------------------------->
    self.lblOptionA = [[UILabel alloc] initWithFrame:CGRectMake(185, 267, 520, 82)];
    _lblOptionA.backgroundColor = [UIColor clearColor];
    [_lblOptionA setTextColor:[UIColor blackColor]];
    [_lblOptionA setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:_lblOptionA];
    
    self.lblOptionB = [[UILabel alloc] initWithFrame:CGRectMake(185, 408, 520, 82)];
    _lblOptionB.backgroundColor = [UIColor clearColor];
    [_lblOptionB setTextColor:[UIColor blackColor]];
    [_lblOptionB setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:_lblOptionB];
    
    self.lblOptionC = [[UILabel alloc] initWithFrame:CGRectMake(185, 548, 520, 82)];
    _lblOptionC.backgroundColor = [UIColor clearColor];
    [_lblOptionC setTextColor:[UIColor blackColor]];
    [_lblOptionC setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:_lblOptionC];
    
    self.lblOptionD = [[UILabel alloc] initWithFrame:CGRectMake(185, 693, 520, 82)];
    _lblOptionD.backgroundColor = [UIColor clearColor];
    [_lblOptionD setTextColor:[UIColor blackColor]];
    [_lblOptionD setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:_lblOptionD];
    
    //<------------------------4个选项按钮UIButton----------------------------->
    self.btnOptionA = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOptionA.frame = CGRectMake(68, 267, 637, 82);
    [self.view addSubview:_btnOptionA];
    
    self.btnOptionB = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOptionB.frame = CGRectMake(68, 408, 637, 82);
    [self.view addSubview:_btnOptionB];
    
    self.btnOptionC = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOptionC.frame = CGRectMake(68, 548, 637, 82);
    [self.view addSubview:_btnOptionC];
    
    self.btnOptionD = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOptionD.frame = CGRectMake(68, 693, 637, 82);
    [self.view addSubview:_btnOptionD];
    
    //<------------------------3个底部按钮UIButton--------------------------->
    self.btnCommit = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCommit.frame = CGRectMake(68, 837, 202, 60);
    [_btnCommit addTarget:self action:@selector(clickedCommit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnCommit];
    
    self.btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnNext.frame = CGRectMake(300, 836, 202, 60);
    [_btnNext addTarget:self action:@selector(clickedNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnNext];
    
    self.btnSeeAnswer = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSeeAnswer.frame = CGRectMake(508, 836, 202, 60);
    [_btnSeeAnswer addTarget:self action:@selector(clickedSeeAnswer:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSeeAnswer];
}


- (void)clickedCommit:(UIButton *)sender
{
    Record *aRecord = [_records objectAtIndex:_currentGroup*20+_currentItem];
    NSString *str = aRecord.rAnswer;
    
    popResult *result = [[popResult alloc] init];
    [self presentPopupViewController:result animationType:MJPopupViewAnimationSlideBottomTop];
    
    NSLog(@"cc");
}

- (void)clickedNext:(id)sender
{
    NSLog(@"nn");
    _currentItem++;
    if (_currentItem >= 20) {
        _btnNext.enabled = NO;
    } else {
    [self fillContent];
    }
}

- (void)clickedSeeAnswer:(UIButton *)sender
{

    Record *aRecord = [_records objectAtIndex:_currentGroup*20+_currentItem];
    NSString *str = aRecord.rAnswer;
        NSLog(@"answer====%@",str);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
