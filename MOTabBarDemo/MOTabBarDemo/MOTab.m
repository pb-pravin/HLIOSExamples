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
        // Set the
//        NSString *selectedName = [NSString stringWithFormat:@"%@Active.%@",
//                                  [imageName stringByDeletingPathExtension],
//                                  [imageName pathExtension]];
//		
//		[self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//		[self setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
//        
//        NSString *bgImageName = @"TabBackground.png";
//        UIImage *bgImage = [[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
//        [self setBackgroundImage:bgImage forState:UIControlStateNormal];
        
//        NSString *bgSelectedImageName = @"TabBackgroundActive.png";
//        UIImage *bgSelectedImage = [[UIImage imageNamed:bgSelectedImageName] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
//        [self setBackgroundImage:bgSelectedImage forState:UIControlStateSelected];
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
        
        [self setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
        
        [self setNeedsLayout];
    }
}

@end
