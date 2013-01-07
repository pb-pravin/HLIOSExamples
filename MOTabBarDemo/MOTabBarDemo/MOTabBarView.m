//
//  MOTabBarView.m
//  MOTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOTabBarView.h"
#import "MOTabBar.h"

@implementation MOTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setTabBar:(MOTabBar *)aTabBar
{
    if (_tabBar != aTabBar)
    {
        [_tabBar removeFromSuperview];
        _tabBar = aTabBar;
        [self addSubview:_tabBar];
    }
}

- (void)setContentView:(UIView *)aContentView
{
	[_contentView removeFromSuperview];
	_contentView = aContentView;
	_contentView.frame = CGRectMake(0, 0, self.bounds.size.width, self.tabBar.frame.origin.y);
    
	[self addSubview:_contentView];
	[self sendSubviewToBack:_contentView];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	CGRect f = _contentView.frame;
	f.size.height = self.tabBar.frame.origin.y;
	_contentView.frame = f;
	[_contentView layoutSubviews];
}


@end
