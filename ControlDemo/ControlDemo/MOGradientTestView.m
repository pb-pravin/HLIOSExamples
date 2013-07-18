//
//  MOGradientTestView.m
//  ControlDemo
//
//  Created by an hailin on 3/7/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//
#import <CoreGraphics/CoreGraphics.h>
#import "MOGradientTestView.h"

@implementation MOGradientTestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    const CGFloat *colors1 = CGColorGetComponents([UIColor redColor].CGColor);
    const CGFloat *colors2 = CGColorGetComponents([UIColor blackColor].CGColor);
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        colors1[0], colors1[1], colors1[2], colors1[3],
        colors2[0], colors2[1], colors2[2], colors2[3],
    };
	
	CGGradientRef _normalGradient = CGGradientCreateWithColorComponents(rgb,
																		colors,
																		NULL,
																		sizeof(colors) / (sizeof(colors[0]) * 4));
    CGColorSpaceRelease(rgb);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint startPoint = rect.origin;
	startPoint.x = 100;
    startPoint.y = 100;
    CGPoint endPoint = CGPointMake(50, 50);
//	endPoint.y -= 50;
	
	NSLog(@"start point: %@, end point: %@", NSStringFromCGPoint(startPoint), NSStringFromCGPoint(endPoint));
	
	//draw blue gradient
//	CGContextDrawLinearGradient(context,
//								_normalGradient,
//								startPoint,
//								endPoint,
//								kCGGradientDrawsBeforeStartLocation);
	//draw blue gradient
	CGContextDrawRadialGradient(context,
								_normalGradient,
								startPoint,
								50.f,
								endPoint,
								50,
								kCGGradientDrawsBeforeStartLocation);

}

@end
