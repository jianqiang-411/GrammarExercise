//
//  KZAppDelegate.h
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-4.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface KZAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
