//
//  MOModalViewController.h
//  UIButtonTest
//
//  Created by an hailin on 27/12/12.
//  Copyright (c) 2012 an hailin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOBarButtonItem.h"

@class MOModalViewController;

@protocol MOModalViewControllerDelegate
- (void)modalViewController:(MOModalViewController *)controller DidEdit:(NSString *)result;
@end

@interface MOModalViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) id <MOModalViewControllerDelegate> delegate;

@end
