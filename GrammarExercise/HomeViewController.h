//
//  KZFirstViewController.h
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-4.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridView.h"
#import "UIGridViewDelegate.h"

@interface HomeViewController : UIViewController<UIGridViewDelegate>
{


}

@property (nonatomic, retain) UIGridView *table;

@end
