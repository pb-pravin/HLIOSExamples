//
//  HLIntroductionViewController.h
//  IntroductionDemo
//
//  Created by an hailin on 1/5/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLIntroductionViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@end
