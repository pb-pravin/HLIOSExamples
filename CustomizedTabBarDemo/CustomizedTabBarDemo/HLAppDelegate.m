//
//  HLAppDelegate.m
//  CustomizedTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "HLAppDelegate.h"
#import "HLViewController1.h"
#import "HLViewController2.h"
#import "HLViewController3.h"

@implementation HLAppDelegate

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//    _tabBarController = [[UITabBarController alloc] init];
//    
//    HLViewController1 *viewController1 = [[[HLViewController1 alloc] init] autorelease];
//    HLViewController2 *viewController2 = [[[HLViewController2 alloc] init] autorelease];
//    HLViewController3 *viewController3 = [[[HLViewController3 alloc] init] autorelease];
//
//    _tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, viewController3, nil];
    
    [self setUpTabBar];
    self.window.rootViewController = _tabBarController;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)setUpTabBar {
    
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.view.backgroundColor = [UIColor redColor];
    
    HLViewController1 *firstViewController = [[HLViewController1 alloc]init];
    firstViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:nil tag:1];
    UINavigationController *firstNavController = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    
    HLViewController2 *secondViewController = [[HLViewController2 alloc]init];
                                      secondViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:nil tag:2];
    UINavigationController *secondNavController = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    secondViewController.tabBarItem.badgeValue = @"12";
    
    HLViewController3 *thirdViewController = [[HLViewController3 alloc]init];
    thirdViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:nil tag:3];
    UINavigationController *thirdNavController = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
    
    _tabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavController, secondNavController, thirdNavController, nil];
    _tabBarController.delegate=self;
    _tabBarController.selectedIndex=0;
    
    [firstNavController release];
    [firstViewController release];
    
    [secondNavController release];
    [secondViewController release];
    
    [thirdNavController release];
    [thirdViewController release];
    
    //UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 432, 107, 49)];
    //serivceImg=[[UIImageView alloc]initWithFrame:view1.bounds];
    serivceImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 432, 107, 49)];
    serivceImg.image=[UIImage imageNamed:kserviceHover];
 //   [view1 addSubview:serivceImg];
    
   // UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(107, 432,107, 49)];
//    contactImg=[[UIImageView alloc]initWithFrame:view2.bounds];
    contactImg=[[UIImageView alloc]initWithFrame:CGRectMake(107, 432,107, 49)];
    contactImg.image=[UIImage imageNamed:ktabContact];
   // [view2 addSubview:contactImg];
    
    //UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(214, 432,106, 49)];
//    bookingImg=[[UIImageView alloc]initWithFrame:view3.bounds];
        bookingImg=[[UIImageView alloc]initWithFrame:CGRectMake(214, 432,106, 49)];
    bookingImg.image=[UIImage imageNamed:ktabBooking];
//    [view3 addSubview:bookingImg];
    
    
//    [_tabBarController.view addSubview:view1];
//    [_tabBarController.view addSubview:view2];
//    [_tabBarController.view addSubview:view3];
    [_tabBarController.view addSubview:serivceImg];
    [_tabBarController.view addSubview:contactImg];
    [_tabBarController.view addSubview:bookingImg];
    
    [serivceImg release];
    [contactImg release];
    [bookingImg release];
//    [view1 release];
//    [view2 release];
//    [view3 release];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController1{
    
    if (viewController1 == [_tabBarController.viewControllers objectAtIndex:0])
        
    {
        
        serivceImg.image = [UIImage imageNamed:kserviceHover];
        contactImg.image=[UIImage imageNamed:ktabContact];
        bookingImg.image=[UIImage imageNamed:ktabBooking];
        
        
    }
    
    else if (viewController1 == [_tabBarController.viewControllers objectAtIndex:1])
        
    {
        
        serivceImg.image = [UIImage imageNamed:kservice];
        contactImg.image=[UIImage imageNamed:ktabContactHover];
        bookingImg.image=[UIImage imageNamed:ktabBooking];
        
    }
    
    else if (viewController1 == [_tabBarController.viewControllers objectAtIndex:2])
        
    {
        
        serivceImg.image = [UIImage imageNamed:kservice];
        contactImg.image=[UIImage imageNamed:ktabContact];
        bookingImg.image=[UIImage imageNamed:ktabBookingHover];
        
    }
    
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
