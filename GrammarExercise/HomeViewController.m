//
//  KZFirstViewController.m
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-4.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import "HomeViewController.h"
#import "Cell.h"
#import "oneExerciseViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize table;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"home.png"];
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Home";
    
    
    //self.table = [[UIGridView alloc] initWithFrame:CGRectMake(30, 40, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.table = [[UIGridView alloc]initWithFrame:CGRectMake(30, 40, self.view.frame.size.width, self.view.frame.size.height)];
    [self.table setSeparatorStyle:UITableViewCellSelectionStyleNone];
    self.table.uiGridViewDelegate = self;
    self.view = self.table;
    
    //uiGridViewDelegate = self;
    //table.dataSource = self;
    //table.delegate = self;
    
    //[self.view addSubview:self.table];
}

- (void)viewWillAppear:(BOOL)animated
{
    //[self.navigationController setNavigationBarHidden:YES];
    [super viewWillAppear:animated];
}

- (CGFloat) gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
	return 100;
}

- (CGFloat) gridView:(UIGridView *)grid heightForRowAt:(int)rowIndex
{
	return 100;
}

- (NSInteger) numberOfColumnsOfGridView:(UIGridView *) grid
{
	return 5;
}


- (NSInteger) numberOfCellsOfGridView:(UIGridView *) grid
{
	return 20;
}

- (UIGridViewCell *) gridView:(UIGridView *)grid cellForRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
	Cell *cell = (Cell *)[grid dequeueReusableCell];
	
	if (cell == nil) {
		cell = [[Cell alloc] init];
	}
	
	cell.label.text = [NSString stringWithFormat:@"(%d,%d)", rowIndex, columnIndex];
    
    NSArray *pics_row1 = [[NSArray alloc] initWithObjects:@"icon01",@"icon02",@"icon03", @"icon04",@"icon05",nil];
    NSArray *pics_row2 = [[NSArray alloc] initWithObjects:@"icon06",@"icon07",@"icon08", @"icon09",@"icon10",nil];
    NSArray *pics_row3 = [[NSArray alloc] initWithObjects:@"icon11",@"icon12",@"icon13", @"icon14",@"icon15",nil];
    NSArray *pics_row4 = [[NSArray alloc] initWithObjects:@"icon16",@"icon17",@"icon18", @"icon19",@"icon20",nil];
    
    if (rowIndex == 0) {
        
        cell.thumbnail.image = [UIImage imageNamed:[pics_row1 objectAtIndex:columnIndex]];
    }
    if (rowIndex == 1) {
        
        cell.thumbnail.image = [UIImage imageNamed:[pics_row2 objectAtIndex:columnIndex]];
    }
    if (rowIndex == 2) {
        
        cell.thumbnail.image = [UIImage imageNamed:[pics_row3 objectAtIndex:columnIndex]];
    }
    if (rowIndex == 3) {
        
        cell.thumbnail.image = [UIImage imageNamed:[pics_row4 objectAtIndex:columnIndex]];
    }
	
	return cell;
}

- (void) gridView:(UIGridView *)grid didSelectRowAt:(int)rowIndex AndColumnAt:(int)colIndex
{
    oneExerciseViewController  *oneEx = [[oneExerciseViewController alloc ] init];
    
    [self.navigationController pushViewController:oneEx animated:YES];
    
	NSLog(@"%d, %d clicked", rowIndex, colIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
