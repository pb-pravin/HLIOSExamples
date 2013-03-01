//
//  MOAppDelegate.m
//  ExtensionUtilsDemo
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOAppDelegate.h"

#import "MOViewController.h"
#import "NSDictionary+JSONCategories.h"
#import "NSMutableDictionary+JSONCategories.h"

@implementation MOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	self.viewController = [[MOViewController alloc] initWithNibName:@"MOViewController" bundle:nil];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
	
	/** Demo the usage of NSDictionary/NSMutableDictionary JSONCategories
	 */
	NSString *path = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"json"];
	NSDictionary *infoFromFile = [NSDictionary dictionaryWithContentsOfJSONFile:path];
	NSLog(@"infoFromFile: %@", infoFromFile);
	
	NSMutableDictionary *mutableInfoFromFile = [NSMutableDictionary dictionaryWithContentsOfJSONFile:path];
	[mutableInfoFromFile setObject:@"An Hailin" forKey:@"name"];
	NSLog(@"mutableInfoFromFile: %@", mutableInfoFromFile);
	
	NSString *urlAddress = @"http://api.kivaws.org/v1/loans/search.json?status=fundraising";
	NSDictionary *infoFromURL = [NSDictionary dictionaryWithContentsOfJSONURLString:urlAddress];
	NSLog(@"infoFromURL: %@", infoFromURL);
	
	NSMutableDictionary *mutableInfoFromURL = [NSMutableDictionary dictionaryWithContentsOfJSONURLString:urlAddress];
	[mutableInfoFromURL setObject:@"An Hailin" forKey:@"name"];
	NSLog(@"mutableInfoFromURL: %@", mutableInfoFromURL);
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
