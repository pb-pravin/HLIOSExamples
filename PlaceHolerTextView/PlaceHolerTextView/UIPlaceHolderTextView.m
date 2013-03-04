//
//  UIPlaceHolderTextView.m
//  Mozat
//
//  Created by tao tao on 11/1/12.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import "UIPlaceHolderTextView.h"

@interface UIPlaceHolderTextView () {
	
@private
    UILabel *placeHolderLabel;
	UIColor *placeholderColor;
	UILabel *leftCharacterLabel;
}

@property (nonatomic, retain) UILabel *placeHolderLabel;
@property (nonatomic, retain) UIColor *placeholderColor;
@property (nonatomic, retain) UILabel *leftCharacterLabel;
@end

@implementation UIPlaceHolderTextView
@synthesize placeHolderLabel;
@synthesize placeholder;
@synthesize placeholderColor;
@synthesize leftCharacterLabel;
@synthesize maxNumberOfCharacter;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [placeHolderLabel release]; placeHolderLabel = nil;
    [placeholderColor release]; placeholderColor = nil;
    [placeholder release]; placeholder = nil;
	self.leftCharacterLabel = nil;
    [super dealloc];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setPlaceholder:@""];
    [self setPlaceholderColor:[UIColor lightGrayColor]];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(textChanged:)
												 name:UITextViewTextDidChangeNotification
											   object:self];
}

- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]) )
    {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(textChanged:)
													 name:UITextViewTextDidChangeNotification
												   object:self];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
	
    if([[self text] length] == 0)
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    else
    {
        [[self viewWithTag:999] setAlpha:0];
    }
	leftCharacterLabel.text = [NSString stringWithFormat:@"%d", self.maxNumberOfCharacter-self.text.length];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)setMaxNumberOfCharacter:(NSUInteger)leftCount {
	maxNumberOfCharacter = leftCount;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 )
    {
        if ( placeHolderLabel == nil )
        {
            placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
            placeHolderLabel.lineBreakMode = UILineBreakModeWordWrap;
            placeHolderLabel.numberOfLines = 0;
            placeHolderLabel.font = self.font;
            placeHolderLabel.backgroundColor = [UIColor clearColor];
            placeHolderLabel.textColor = self.placeholderColor;
            placeHolderLabel.alpha = 0;
            placeHolderLabel.tag = 999;
            [self addSubview:placeHolderLabel];
        }
		
        placeHolderLabel.text = self.placeholder;
        [placeHolderLabel sizeToFit];
        [self sendSubviewToBack:placeHolderLabel];
    }
	
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
	
	if (leftCharacterLabel == nil)
	{
		leftCharacterLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, self.bounds.size.height-5-21, self.bounds.size.width-16, 21)];
		leftCharacterLabel.text = [NSString stringWithFormat:@"%d", self.maxNumberOfCharacter-self.text.length];
		leftCharacterLabel.backgroundColor = [UIColor redColor];
		leftCharacterLabel.alpha = 0.6;
		leftCharacterLabel.textAlignment = UITextAlignmentRight;
		[self addSubview:leftCharacterLabel];
	}
	
    [super drawRect:rect];
}

@end
