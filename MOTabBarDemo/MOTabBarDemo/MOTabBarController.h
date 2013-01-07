//
//  MOTabBarController.h
//  MOTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOTabBar.h"
@class MOTabBarView;


@interface MOTabBarController : UIViewController <MOTabBarDelegate>
@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, retain) MOTabBarView *tabBarView;
@property (nonatomic, retain) MOTabBar *tabBar;
@property (nonatomic, retain) UIViewController *selectedViewController;
@property (nonatomic) NSUInteger selectedIndex;
@end
