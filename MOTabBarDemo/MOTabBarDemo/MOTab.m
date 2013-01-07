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

- (id)initWithIconImageName:(NSString *)imageName 
{
    self = [super init];
    if (self)
    {
        NSString *selectedName = [NSString stringWithFormat:@"%@Active.%@",
                                  [imageName stringByDeletingPathExtension],
                                  [imageName pathExtension]];
		
		[self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
		[self setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
        
        NSString *bgImageName = @"TabBackground.png";
        UIImage *bgImage = [[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
        [self setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    return self;
}

- (void)setActive:(BOOL)active
{
    if (_active != active)
    {
        _active = active;
        NSString *bgImageName = @"TabBackground.png";
        if (_active)
        {
            bgImageName = @"TabBackgroundActive.png";
        }
        
        UIImage *bgImage = [[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
        [self setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
}

@end
