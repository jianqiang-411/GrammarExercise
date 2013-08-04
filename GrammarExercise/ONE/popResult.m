//
//  popResult.m
//  GrammarExercise
//
//  Created by ZHOU HONG on 8/1/13.
//  Copyright (c) 2013 Kylinzhou. All rights reserved.
//

#import "popResult.h"
#import <QuartzCore/QuartzCore.h>

@implementation popResult

@synthesize bgview;
@synthesize popbg;
@synthesize urAnswer;
@synthesize corrAnswer;
@synthesize scorePlus;
@synthesize scoreTotle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];


    //popbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgti"]];
    self.popbg = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 520, 600)];
    
    //UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    //self.popbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgti"]];
    
    self.popbg.image = [UIImage imageNamed:@"bgti"];
    //[self.view addSubview:bgview];
    //[window addSubview:popbg];
    self.view = popbg;
    //[self.view addSubview:popbg];


}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
        
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
