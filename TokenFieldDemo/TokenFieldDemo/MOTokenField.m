//
//  MOTokenField.m
//  TokenFieldDemo
//
//  Created by an hailin on 19/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOTokenField.h"
#import <QuartzCore/QuartzCore.h>

@implementation MOTokenField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.tokens = [NSMutableArray array];
		
        MOToken *token1 = [MOToken tokenWithTitle:@"AnHailin" associatedObject:nil container:nil];
        MOToken *token2 = [MOToken tokenWithTitle:@"SunLin" associatedObject:nil container:nil];
		MOToken *token3 = [MOToken tokenWithTitle:@"AnHailin" associatedObject:nil container:nil];
        MOToken *token4 = [MOToken tokenWithTitle:@"SunLin" associatedObject:nil container:nil];
		MOToken *token5 = [MOToken tokenWithTitle:@"AnHailin" associatedObject:nil container:nil];
        MOToken *token6 = [MOToken tokenWithTitle:@"SunLin" associatedObject:nil container:nil];
		MOToken *token7 = [MOToken tokenWithTitle:@"AnHailin" associatedObject:nil container:nil];
        MOToken *token8 = [MOToken tokenWithTitle:@"SunLin" associatedObject:nil container:nil];
        [self.tokens addObject:token1];
        [self.tokens addObject:token2];
		[self.tokens addObject:token3];
        [self.tokens addObject:token4];
		[self.tokens addObject:token5];
        [self.tokens addObject:token6];
		[self.tokens addObject:token7];
        [self.tokens addObject:token8];
		
		// Setup text field
		NSParameterAssert(CGRectGetHeight(self.bounds) > kTokenFieldRowHeight);
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(kTokenFieldPaddingX,
                                                                       (CGRectGetHeight(self.bounds) - kTokenFieldRowHeight) / 2.0,
                                                                       CGRectGetWidth(self.bounds) - kTokenFieldPaddingX * 2.0,
                                                                       kTokenFieldRowHeight)];
        self.textField.opaque = NO;
        self.textField.backgroundColor = [UIColor clearColor];
        self.textField.font = [UIFont systemFontOfSize:kTokenFieldFontSize];
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.textField.delegate = self;
		
        [self.textField addTarget:self action:@selector(tokenInputChanged:) forControlEvents:UIControlEventEditingChanged];
		// This is for testing.
		self.textField.layer.borderColor = [UIColor redColor].CGColor;
		self.textField.layer.borderWidth = 1.0f;
        [self addSubview:self.textField];
		
        [self setNeedsLayout];
    }
    return self;
}

- (void)layoutSubviews
{
    NSUInteger row = 0;
    NSInteger tokenCount = (NSInteger)self.tokens.count;
	
    CGFloat left = kTokenFieldPaddingX;
    CGFloat maxLeft = CGRectGetWidth(self.bounds) - (CGFloat)kTokenFieldPaddingX;
	
    for (NSInteger i = 0; i < tokenCount; i++)
    {
        MOToken *token = [self.tokens objectAtIndex:(NSUInteger)i];
        CGFloat right = left + CGRectGetWidth(token.bounds);
        if (right > maxLeft)
        {
            row++;
            left = kTokenFieldPaddingX;
        }
		
		// Adjust token frame
        CGRect tokenFrame = token.frame;
        tokenFrame.origin = CGPointMake(left, (CGFloat)row * kTokenFieldRowHeight + (kTokenFieldRowHeight - CGRectGetHeight(tokenFrame)) / 2.0f + (CGFloat)kTokenFieldPaddingY);
        token.frame = tokenFrame;
		
        left += CGRectGetWidth(tokenFrame) + kTokenFieldPaddingX;
		token.layer.borderWidth = 1.0f;
		token.layer.borderColor = [UIColor redColor].CGColor;
        [self addSubview:token];
    }
	
    CGFloat maxLeftWithButton = maxLeft - (CGFloat)kTokenFieldPaddingX;
    if (maxLeftWithButton - left < 50)
    {
        row++;
        left = kTokenFieldPaddingX;
    }
	
    CGRect textFieldFrame = self.textField.frame;
    textFieldFrame.origin = CGPointMake(left, (CGFloat)row * kTokenFieldRowHeight + (kTokenFieldRowHeight - CGRectGetHeight(textFieldFrame)) / 2.0f + (CGFloat)kTokenFieldPaddingY);
    textFieldFrame.size = CGSizeMake(maxLeftWithButton - left, CGRectGetHeight(textFieldFrame));
    self.textField.frame = textFieldFrame;
	
    CGRect tokenFieldFrame = self.frame;
    //CGFloat minHeight = MAX(kTokenFieldRowHeight, CGRectGetHeight(self.addContactButton.frame) + (CGFloat)kTokenFieldPaddingY * 2.0f);
    tokenFieldFrame.size.height = MAX(kTokenFieldRowHeight, CGRectGetMaxY(textFieldFrame) + (CGFloat)kTokenFieldPaddingY);
	
    self.frame = tokenFieldFrame;
}

- (void)processToken:(NSString *)tokenText associatedRecord:(COPerson *)record
{
    COToken *token = [COToken tokenWithTitle:tokenText associatedObject:record container:self];
    [token addTarget:self action:@selector(selectToken:) forControlEvents:UIControlEventTouchUpInside];
    [self.tokens addObject:token];
    self.textField.text = kCOTokenFieldDetectorString;
    [self setNeedsLayout];
}


- (void)dealloc
{
    self.tokens = nil;
    self.textField = nil;
	self.selectedToken = nil;
    [super dealloc];
}

@end
