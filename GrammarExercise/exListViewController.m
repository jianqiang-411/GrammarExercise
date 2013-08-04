//
//  exListViewController.m
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-12.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import "exListViewController.h"

@interface exListViewController ()

@end

@implementation exListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"第一组习题列表"; 
        self.view.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
