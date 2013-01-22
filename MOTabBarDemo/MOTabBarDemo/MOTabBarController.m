//
//  MOTabBarController.m
//  MOTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOTabBarController.h"
#import "MOTab.h"
#import "MOTabBar.h"
#import "MOTabBarView.h"

@interface MOTabBarController ()

@end

@implementation MOTabBarController

- (void)dealloc
{
    [_viewControllers release];
    [_tabBarView release];
    [_tabBar release];
    [_selectedViewController release];
    [super dealloc];
}


- (id)init
{
    self = [super init];
    if (self)
    {

    }
    return self;
}


- (void)loadView
{
    // Create tabBarView
    _tabBarView = [[MOTabBarView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	_tabBarView.backgroundColor = [UIColor clearColor];
	self.view = _tabBarView;
    
    CGFloat tabBarHeight = 48;
    _tabBar = [[MOTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - tabBarHeight, self.view.bounds.size.width, tabBarHeight)];
    _tabBar.delegate = self;
    _tabBar.backgroundColor = [UIColor redColor];
    _tabBarView.tabBar = _tabBar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


// MOTabBarDelegate method, called when user selected a tab.
- (void)tabBar:(MOTabBar *)aTabBar didSelectTabAtIndex:(NSInteger)index
{
	UIViewController *vc = [self.viewControllers objectAtIndex:index];
	if (self.selectedViewController == vc)
    {
		if ([self.selectedViewController isKindOfClass:[UINavigationController class]])
        {
			[(UINavigationController *)self.selectedViewController popToRootViewControllerAnimated:YES];
		}
	}
    else
    {
        // Set the selected view, It will change the contentView
		self.selectedViewController = vc;
	}
}

- (void)setSelectedViewController:(UIViewController *)vc
{
	if (_selectedViewController != vc)
    {
        [_selectedViewController release];
		_selectedViewController = [vc retain];

        MOTabBarView *tabBarView = (MOTabBarView *)self.view;
		tabBarView.contentView = vc.view;
		
        // When a viewController is selected programatically, tell the tabBar to make
        // corresponding change.
        
        
		[tabBarView.tabBar setSelectedTab:[tabBarView.tabBar.tabs objectAtIndex:self.selectedIndex]];
	}
}

- (NSUInteger)selectedIndex
{
	return [self.viewControllers indexOfObject:self.selectedViewController];
}

- (void)setSelectedIndex:(NSUInteger)aSelectedIndex
{
    // Eventually, change the selected view controller.
	if (self.viewControllers.count > aSelectedIndex)
		self.selectedViewController = [self.viewControllers objectAtIndex:aSelectedIndex];
}

- (void)setViewControllers:(NSArray *)array
{
	if (array != _viewControllers)
    {
		[_viewControllers release];
        _viewControllers = [array retain];
	}
	
    // the first view controller is selected by default.
    self.selectedIndex = 1;
    self.selectedIndex = 2;
    self.selectedIndex = 0;
}

@end
