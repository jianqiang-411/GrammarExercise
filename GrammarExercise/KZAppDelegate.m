//
//  KZAppDelegate.m
//  GrammarExercise
//
//  Created by shangde.Jim on 13-7-4.
//  Copyright (c) 2013年 Kylinzhou. All rights reserved.
//

#import "KZAppDelegate.h"
#import "DataModel.h"
#import "HomeViewController.h"

#import "MistakesViewController.h"

#import "InfoViewController.h"


@implementation KZAppDelegate

@synthesize window = _window;

@synthesize tabBarController = _tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    dispatch_async(dispatch_queue_create ("com.iphonedevblog.post", NULL), ^{ [[DataModel shareDataModel] fetchAllRecords];});

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UIViewController *viewController1 = [[HomeViewController alloc] init];
    UIViewController *viewController2 = [[MistakesViewController alloc] init];
    UIViewController *viewController3 = [[InfoViewController alloc] init];
    
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers =[NSArray arrayWithObjects:navController1, navController2, navController3,nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
