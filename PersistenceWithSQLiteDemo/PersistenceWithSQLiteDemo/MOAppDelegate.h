//
//  MOAppDelegate.h
//  PersistenceWithSQLiteDemo
//
//  Created by an hailin on 25/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MOImagePickerController;

@interface MOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MOImagePickerController *viewController;

@end
