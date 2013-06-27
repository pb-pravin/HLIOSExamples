//
//  AppDelegate.m
//  NSThreadDemo
//
//  Created by an hailin on 29/5/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface ThreadA : NSThread

@end

@implementation ThreadA

//- (id)init
//{
//	self = [super init];
//	if (self)
//	{
//		[self setName:@"ThreadA"];
//	}
//	return self;
//}

- (void)main
{
	[[NSThread currentThread] setName:@"ThreadA"];
//	for (int i=0; i<10; i++) {
//		NSLog(@"count %d", i);
//		[NSThread sleepForTimeInterval:1];
//	}
	NSLog(@"ThreadA call stack backtrace: %@", [NSThread callStackSymbols]);
	[[NSNotificationCenter defaultCenter] postNotificationName:@"hello" object:nil];
}

@end


@implementation AppDelegate

- (void)happen:(NSNotification *)notification
{
	NSLog(@"notification: %@", notification.name);
}

- (void)printCount:(NSTimer *)timer
{
	NSLog(@"count %@", [timer fireDate]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(happen:) name:NSWillBecomeMultiThreadedNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(happen:)
                                                 name:NSThreadWillExitNotification
                                               object:nil];
	
	NSLog(@"multi-threaded: %d", [NSThread isMultiThreaded]);
	NSLog(@"is main thread: %d", [NSThread isMainThread]);
	NSLog(@"thread priority: %f", [NSThread threadPriority]);
	//[NSThread sleepForTimeInterval:2];
	NSThread *mainThread = [NSThread mainThread];
	NSLog(@"main thread: %@", mainThread);
	
	NSThread *currentThread = [NSThread currentThread];
	NSLog(@"current thread: %@", currentThread);
	
	NSLog(@"is executing: %d", [currentThread isExecuting]);
	NSLog(@"is finished: %d", [currentThread isFinished]);
	NSLog(@"is canceled: %d", [currentThread isCancelled]);
	NSLog(@"Cancel the current thread.");
	[currentThread cancel];
	NSLog(@"is canceled: %d", [currentThread isCancelled]);
	// It seems that main thread can not be canceled, isCanceled state always returns NO even we perform cancel method on it.
	
	NSLog(@"Set the name of the current thread");
	[currentThread setName:@"Main thread"];
	// This feature is usefull when debugging, you can easily identify threads being executing.
	
	NSLog(@"Call stack symbols: %@", [NSThread callStackSymbols]);
	// This is very usefull for debugging.
	
	NSLog(@"Call stack return addresses: %@", [NSThread callStackReturnAddresses]);
	
	/*You can use the returned dictionary to store thread-specific data. The thread dictionary is not used during any manipulations of the NSThread object—it is simply a place where you can store any interesting data. For example, Foundation uses it to store the thread’s default NSConnection and NSAssertionHandler instances. You may define your own keys for the dictionary.*/
	NSLog(@"current thread's dictionary: %@", [currentThread threadDictionary]);
	
	
	NSLog(@"runloop object: %@", [NSRunLoop currentRunLoop]);
	NSLog(@"runloop's current run mode: %@", [[NSRunLoop currentRunLoop] currentMode]);
	NSLog(@"ns defualt runloop mode name: %@", NSDefaultRunLoopMode);
	NSLog(@"ns runloop common mode name: %@", NSRunLoopCommonModes);
	
	ThreadA *threadA = [[ThreadA alloc] init];
	[threadA start];
//
//	while (![threadA isFinished]) {
//		NSLog(@"thread A is executing.");
//		[NSThread sleepForTimeInterval:0.8];
//	}
//
	
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		__block NSTimer *timer = nil;
		// The timer must be scheduled on a runloop.
        /**
         You must add the new timer to a run loop, using addTimer:forMode:. Then, after seconds seconds have elapsed, the timer fires, sending the message aSelector to target. (If the timer is configured to repeat, there is no need to subsequently re-add the timer to the run loop.)
         */
		timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(printCount:) userInfo:nil repeats:YES];
//		dispatch_async(dispatch_get_main_queue(), ^{
			[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//		});
		[timer fire];
	});
	
	
//	NSLog(@"Exit the maine thread");
//	[NSThread exit];
	
	// 
	NSLog(@"###");
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
	self.window.rootViewController = self.viewController;
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
