//
//  MOBadgeView.m
//  PlaceHolerTextView
//
//  Created by an hailin on 7/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOBadgeView.h"

#define kDefaultBadgeColor	[UIColor whiteColor]
#define kDefaultBadgeFont	[UIFont systemFontOfSize:13.f]
#define kLeftMargin			3

@interface MOBadgeView () {
	@private
	UIImageView *_bgImageView;
	UILabel *_badgeLabel;
}
@end

@implementation MOBadgeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _bgImageView = [[UIImageView alloc] initWithFrame:frame];
		_bgImageView.image =
		[[UIImage imageNamed:@"UnreadCountIndicator.png"] stretchableImageWithLeftCapWidth:9 topCapHeight:8];
		_bgImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		_badgeLabel = [[UILabel alloc] initWithFrame:frame];
		_badgeLabel.textAlignment = UITextAlignmentCenter;
		_badgeLabel.backgroundColor = [UIColor clearColor];
		_badgeLabel.font = kDefaultBadgeFont;
		_badgeLabel.textColor = kDefaultBadgeColor;
		_badgeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		[self addSubview:_bgImageView];
		[self addSubview:_badgeLabel];
    }
    return self;
}

- (void)dealloc {
	self.badgeColor = nil;
	self.badgeFont = nil;
	[_bgImageView release], _bgImageView = nil;
	[_badgeLabel release], _badgeLabel = nil;
	[super dealloc];
}

- (void)setBadgeColor:(UIColor *)badgeColor {
	if (_badgeColor != badgeColor) {
		[_badgeColor release];
		_badgeColor = [badgeColor retain];
		_badgeLabel.textColor = badgeColor;
	}
}

- (void)setBadgeFont:(UIFont *)badgeFont {
	if (_badgeFont != badgeFont) {
		[_badgeFont release];
		_badgeFont = [badgeFont retain];
		_badgeLabel.font = badgeFont;
		[self setNeedsLayout];
	}
}

- (void)setBadgeNumber:(NSUInteger)badgeNum {
	NSString *text;
	if (badgeNum >= kMaxBadgeNumber) {
		text = [NSString stringWithFormat:@"%d+", kMaxBadgeNumber-1];
	} else {
		text = [NSString stringWithFormat:@"%d", badgeNum];
	}
	_badgeLabel.text = text;
	[self setNeedsLayout];
}

- (void)layoutSubviews {
	// Change view's frame according to the length of text.
	// bgImageView and badgeLabel's frame will be automatically adjusted.
	CGSize size = [_badgeLabel.text sizeWithFont:_badgeLabel.font];
	NSLog(@"font:%@ size:%f",_badgeLabel.font, size.width);
	CGRect frame = self.frame;
	frame.size.width = 2*kLeftMargin + size.width;
	self.frame = frame;
}

@end
