//
//  MOAppDelegate.h
//  SlowWorker
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "A.h"
@class MOImagePickerController;

@interface MOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MOImagePickerController *viewController;

@property (strong, nonatomic) A *a;
@end
