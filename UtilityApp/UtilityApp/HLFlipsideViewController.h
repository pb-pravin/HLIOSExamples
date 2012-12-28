//
//  HLFlipsideViewController.h
//  UtilityApp
//
//  Created by an hailin on 12/28/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLFlipsideViewController;

@protocol HLFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(HLFlipsideViewController *)controller;
@end

@interface HLFlipsideViewController : UIViewController

@property (weak, nonatomic) id <HLFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
