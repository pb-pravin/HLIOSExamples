//
//  MOTab.m
//  MOTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOTab.h"

@implementation MOTab
@synthesize active = _active;

- (void)dealloc
{
    [_imageName release];
    [super dealloc];
}

- (id)initWithIconImageName:(NSString *)imageName 
{
    self = [super init];
    if (self)
    {
        _imageName = [imageName retain];
    }
    return self;
}

- (void)setActive:(BOOL)active
{
    if (_active != active)
    {
        _active = active;
        NSString *bgImageName = @"TabBackground.png";
        NSString *btnImageName = _imageName;
        if (_active)
        {
            bgImageName = @"TabBackgroundActive.png";
            btnImageName = [NSString stringWithFormat:@"%@Active.%@",
                                      [_imageName stringByDeletingPathExtension],
                                      [_imageName pathExtension]];
        }
        
        UIImage *bgImage = [[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
        [self setBackgroundImage:bgImage forState:UIControlStateNormal];
        [self setBackgroundImage:bgImage forState:UIControlStateHighlighted];
        [self setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
		[self setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateHighlighted];
		
        
        [self setNeedsLayout];
    }
}

@end
