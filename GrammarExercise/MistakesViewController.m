//
//  KZSecondViewController.m
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-4.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import "MistakesViewController.h"

@interface MistakesViewController ()

@end
    
@implementation MistakesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"NoteBook", @"NoteBook");
        self.tabBarItem.image = [UIImage imageNamed:@"notepad"];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Mistakes NoteBook";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
