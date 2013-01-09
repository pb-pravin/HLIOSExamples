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
        
        // When a tabBar is initialized, also initialize its tabs specified for Deja
        // Each tab is a button object
        NSMutableArray *tabs = [NSMutableArray arrayWithCapacity:3];
        MOTab *chatsTab = [[[MOTab alloc] initWithIconImageName:@"TabIconChats.png"] autorelease];
        chatsTab.frame = CGRectMake(0, 0, 106, self.bounds.size.height);
        
        UIImageView *separator = [[[UIImageView alloc] initWithFrame:CGRectMake(chatsTab.frame.origin.x + chatsTab.frame.size.width, 0, 1, chatsTab.frame.size.height)] autorelease];
        separator.image = [UIImage imageNamed:@"TabSeparator.png"];
        [self addSubview:separator];
        
        MOTab *socialTab = [[[MOTab alloc] initWithIconImageName:@"TabIconSocial.png"] autorelease];
        socialTab.frame = CGRectMake(107, 0, 106, self.bounds.size.height);
        
        separator = [[[UIImageView alloc] initWithFrame:CGRectMake(socialTab.frame.origin.x + socialTab.frame.size.width, 0, 1, socialTab.frame.size.height)] autorelease];
        separator.image = [UIImage imageNamed:@"TabSeparator.png"];
        [self addSubview:separator];
        
        
        MOTab *meTab = [[[MOTab alloc] initWithIconImageName:@"TabMeMask.png"] autorelease];
        meTab.frame = CGRectMake(214, 0, 106, self.bounds.size.height);
        [tabs addObject:chatsTab];
        [tabs addObject:socialTab];
        [tabs addObject:meTab];
        
        self.tabs = tabs;
        for (MOTab *tab in self.tabs)
        {
            // Put the tabs intto tabBar view hierarchy
            // And add event handler.
            tab.userInteractionEnabled = YES;
            [tab addTarget:self action:@selector(tabSelected:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:tab];
        }
        //self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (IBAction)tabSelected:(MOTab *)sender
{
    // Change the UI of the tab
    [sender setActive:YES];
    for (MOTab *tab in self.tabs)
    {
        if (tab != sender)
        {
            [tab setActive:NO];
        }
    }
    
    // Tell the delegate that a tab is selected.
	[self.delegate tabBar:self didSelectTabAtIndex:[self.tabs indexOfObject:sender]];
}

- (void)setSelectedTab:(MOTab *)aTab
{
	if (aTab != _selectedTab)
    {
		[_selectedTab release];
        _selectedTab = [aTab retain];
		[_selectedTab setActive:YES];
		
		for (MOTab *tab in _tabs)
        {
			if (tab == _selectedTab) continue;
			[tab setActive:NO];
		}
        [self setNeedsLayout];
	}
}

@end
