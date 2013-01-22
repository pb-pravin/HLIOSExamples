//
//  MOAppDelegate.m
//  ControlDemo
//
//  Created by an hailin on 10/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOAppDelegate.h"

#import "MOLabelDemoController.h"
#import "MOButtonDemoController.h"
#import "MOButtonDemo2Controller.h"
#import "MOImageLoadController.h"

@implementation MOAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _tabBarController = [[UITabBarController alloc] init];
    
    // UILabel demo controller
    MOLabelDemoController *labelDemoController = [[MOLabelDemoController alloc] init];
    MOButtonDemoController *buttonDemoController = [[MOButtonDemoController alloc] init];
    MOButtonDemo2Controller *buttonDemo2Controller = [[MOButtonDemo2Controller alloc] init];
    MOImageLoadController *imageLoadController = [[MOImageLoadController alloc] init];
    // UIButton demo controller
    
    
    _tabBarController.viewControllers = @[labelDemoController, buttonDemoController, [[UINavigationController alloc] initWithRootViewController:buttonDemo2Controller], imageLoadController];
    // NSUInteger type, could be NSNotFound, which is effectively NSIntegerMax
    // NSNotFound Defines a value that indicates that an item requested couldn’t be found or doesn’t exist.
    _tabBarController.selectedIndex = 1;
    //[NSThread sleepForTimeInterval:2];
    
    //application.statusBarHidden = NO;
    //NSLog(@"%d", application.statusBarHidden);
    
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

@end
