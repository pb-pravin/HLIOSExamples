//
//  MOTabBar.h
//  MOTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MOTab;

@protocol MOTabBarDelegate;

@interface MOTabBar : UIView
- (void)setSelectedTab:(MOTab *)aTab;
@property (nonatomic, retain) NSArray *tabs;
@property (nonatomic, retain) MOTab *selectedTab;
@property (nonatomic, assign) id <MOTabBarDelegate> delegate;
@end

@protocol MOTabBarDelegate
- (void)tabBar:(MOTabBar *)aTabBar didSelectTabAtIndex:(NSInteger)index;
@end