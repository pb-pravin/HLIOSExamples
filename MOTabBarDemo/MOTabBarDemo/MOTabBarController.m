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


- (void)loadView
{
    _tabBarView = [[MOTabBarView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	_tabBarView.backgroundColor = [UIColor clearColor];
	self.view = _tabBarView;
    
	CGFloat tabBarHeight = 48;
	_tabBar = [[MOTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - tabBarHeight, self.view.bounds.size.width, tabBarHeight)];
	_tabBar.delegate = self;
	_tabBarView.tabBar = _tabBar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// tab bar delegate method
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
		self.selectedViewController = vc;
	}
}

- (void)setSelectedViewController:(UIViewController *)vc
{
	if (_selectedViewController != vc)
    {
        [_selectedViewController release];
		_selectedViewController = [vc retain];

		self.tabBarView.contentView = vc.view;
		
		[self.tabBar setSelectedTab:[self.tabBar.tabs objectAtIndex:self.selectedIndex]];
	}
}

- (NSUInteger)selectedIndex
{
	return [self.viewControllers indexOfObject:self.selectedViewController];
}

- (void)setSelectedIndex:(NSUInteger)aSelectedIndex
{
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
	
	self.selectedIndex = 0;
}

@end
