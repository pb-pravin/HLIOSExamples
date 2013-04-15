//
//  MOAppDelegate.m
//  SlowWorker
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOAppDelegate.h"

#import "MOViewController.h"

@interface MOAppDelegate () {
	dispatch_queue_t _serialQueue;
}
@end

@implementation MOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	self.viewController = [[MOViewController alloc] initWithNibName:@"MOViewController" bundle:nil];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
	
	
	// Demo the dealloc method in ARC project.
	_a = [[A alloc] init];
	_a = nil;	// this line will trigger calling dealloc method.
	
	_serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
	[self f];
	
	dispatch_release(_serialQueue);
    return YES;
}

- (void)f{
	// Definitely, will print 10 'f' first, then 10 'g'.
	// not 'fgfgfgfgfgfgfgfgfg'
	dispatch_async(_serialQueue, ^{
		for (int i=0; i<10; i++) {
			NSLog(@"f");
			[self g];
		}
	});
}

- (void)g {
	dispatch_async(_serialQueue, ^{
		NSLog(@"g");
	});
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
