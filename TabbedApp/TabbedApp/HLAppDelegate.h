//
//  HLAppDelegate.h
//  TabbedApp
//
//  Created by an hailin on 12/28/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
