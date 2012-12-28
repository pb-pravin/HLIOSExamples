//
//  HLModelController.h
//  Page-BasedApp
//
//  Created by an hailin on 12/28/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLDataViewController;

@interface HLModelController : NSObject <UIPageViewControllerDataSource>

- (HLDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(HLDataViewController *)viewController;

@end
