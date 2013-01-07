//
//  MOTabBar.m
//  MOTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOTabBar.h"
#import "MOTab.h"

@implementation MOTabBar

- (void)dealloc
{
    [_tabs release], _tabs = nil;
    [_selectedTab release], _selectedTab = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSMutableArray *tabs = [NSMutableArray arrayWithCapacity:3];
        MOTab *chatsTab = [[[MOTab alloc] initWithIconImageName:@"TabIconChats.png"] autorelease];
        chatsTab.frame = CGRectMake(0, 0, 107, self.bounds.size.height);
        MOTab *socialTab = [[[MOTab alloc] initWithIconImageName:@"TabIconSocial.png"] autorelease];
        socialTab.frame = CGRectMake(107, 0, 107, self.bounds.size.height);
        MOTab *meTab = [[[MOTab alloc] initWithIconImageName:@"TabMeMask.png"] autorelease];
        meTab.frame = CGRectMake(216, 0, 106, self.bounds.size.height);
        [tabs addObject:chatsTab];
        [tabs addObject:socialTab];
        [tabs addObject:meTab];
        
        self.tabs = tabs;
        //self.backgroundColor = [UIColor redColor];
    }
    return self;
}

// When setting tabs
- (void)setTabs:(NSArray *)array
{
    if (_tabs != array)
    {
        for (MOTab *tab in _tabs)
        {
            [tab removeFromSuperview];
        }
        
        [_tabs release];
        _tabs = [array retain];
        
        for (MOTab *tab in _tabs)
        {
            tab.userInteractionEnabled = YES;
            [tab addTarget:self action:@selector(tabSelected:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:tab];
        }
    }
}

- (IBAction)tabSelected:(MOTab *)sender
{
    
    [sender setSelected:YES];
    for (MOTab *tab in self.tabs)
    {
        if (tab != sender)
        {
            [tab setSelected:NO];
        }
    }
    
	[self.delegate tabBar:self didSelectTabAtIndex:[self.tabs indexOfObject:sender]];
}

- (void)setSelectedTab:(MOTab *)aTab
{
	if (aTab != _selectedTab)
    {
		[_selectedTab release];
        _selectedTab = [aTab retain];
		_selectedTab.active = YES;
		
		for (MOTab *tab in _tabs)
        {
			if (tab == aTab) continue;
			tab.active = NO;
		}
	}
}

@end
