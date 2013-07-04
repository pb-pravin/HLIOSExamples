//
//  MOAppDelegate.h
//  LongPressGestureDemo
//
//  Created by an hailin on 21/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MOImagePickerController;

@interface MOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MOImagePickerController *viewController;

@end
