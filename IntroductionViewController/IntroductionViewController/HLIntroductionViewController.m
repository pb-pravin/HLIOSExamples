//
//  HLIntroductionViewController.m
//  IntroductionDemo
//
//  Created by an hailin on 1/5/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "HLIntroductionViewController.h"

const int kNumberOfPage = 4;

@interface HLIntroductionViewController ()

@end

@implementation HLIntroductionViewController

- (void)dealloc
{
    [_scrollView release];
    [_pageControl release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * kNumberOfPage, _scrollView.frame.size.height);
    CGRect rect = _scrollView.frame;
    for (int i=0; i<kNumberOfPage; i++)
    {
        rect.origin.x = i * rect.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"tutorial_%d.png", i]];
        [_scrollView addSubview:imageView];
    }
    
    [self.view addSubview:_scrollView];
    
    CGFloat pageControlHeight = 20;
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,
                                                                   self.view.bounds.size.height - pageControlHeight,
                                                                   320,
                                                                   pageControlHeight)];
    [self.view addSubview:_pageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

@end
