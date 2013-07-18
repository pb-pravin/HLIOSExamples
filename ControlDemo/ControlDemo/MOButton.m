
#import "MOButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+Deja.h"
@implementation MOButton

- (void)setTitle:(NSString *)title
		   image:(UIImage *)image
highlightedImage:(UIImage *)highlightedImage
{
	_image = image;
	_highligtedImage = highlightedImage;
	self.imageView.image = _image;
	self.imageView.frame = CGRectMake((CGRectGetWidth(self.bounds) - image.size.width) / 2,
									  kImageViewTopMargin,
									  image.size.width,
									  image.size.height);
	self.titleLabel.text = title;
	self.titleLabel.frame = CGRectMake(0,
									   CGRectGetHeight(self.bounds) - kTitleLabelBottomMargin - kTitleLabelHeight,
									   CGRectGetWidth(self.bounds),
									   kTitleLabelHeight);
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		self.imageView = [[UIImageView alloc] init];
		[self addSubview:self.imageView];
		
//		self.imageView.layer.borderColor = [UIColor redColor].CGColor;
//		self.imageView.layer.borderWidth = 1;
		
		self.titleLabel = [[UILabel alloc] init];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:kTitleLabelFontSize];
		self.titleLabel.textColor = kTitleLabelDefaultColor;
		self.titleLabel.backgroundColor = [UIColor clearColor];
		self.titleLabel.textAlignment = UITextAlignmentCenter;
		self.titleLabel.numberOfLines = 0;
		[self addSubview:self.titleLabel];
		
//		self.titleLabel.layer.borderWidth = 1;
//		self.titleLabel.layer.borderColor = [UIColor redColor].CGColor;
	}
	return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
	[super setHighlighted:highlighted];
	if (highlighted)
	{
		self.imageView.image = _highligtedImage;
		self.titleLabel.textColor = kTitleLabelHighlightedColor;
	}
	else
	{
		self.imageView.image = _image;
		self.titleLabel.textColor = kTitleLabelDefaultColor;
	}
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
    NSArray *colors = nil;
    if (self.highlighted)
    {
        colors = [NSArray arrayWithObjects:
                  (id)[UIColor colorWithRed:3.0/255.0 green:138.0/255.0 blue:243.0/255.0 alpha:1.0].CGColor,
                  (id)[UIColor colorWithRed:1.0/255.0 green:46.0/255.0 blue:202.0/255.0 alpha:1.0].CGColor,
                  nil];
    }
    else
    {
        colors = [NSArray arrayWithObjects:
                  (id)[UIColor alabasterColor].CGColor,
                  (id)[UIColor altoColor].CGColor,
                  nil];
    }
	
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFTypeRef)colors, NULL);
    CGColorSpaceRelease(colorSpace);
	
    CGContextDrawLinearGradient(ctx, gradient, CGPointZero, CGPointMake(0, CGRectGetHeight(self.bounds)), 0);
    CGGradientRelease(gradient);
}

@end