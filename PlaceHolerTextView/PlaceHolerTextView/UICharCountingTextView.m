//
//  UICharCountingTextView.m
//  Mozat
//
//  Created by Hailin on 8/4/13.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import "UICharCountingTextView.h"
#import <QuartzCore/CALayer.h>

#define kLeftMargin			8
#define kTopMargin			8
#define kCountLabelHeight	18
#define kCornerRadius		8
#define kFontSize			14

@interface UICharCountingTextView ()
@property (nonatomic, retain) UITextView *textView;
@property (nonatomic, retain) UILabel *placeHolderLabel;
@property (nonatomic, retain) UILabel *countLabel;
@end

@implementation UICharCountingTextView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
	self.placeholder = nil;
	self.textView = nil;
    self.placeHolderLabel = nil;
	self.countLabel = nil;
    [super dealloc];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.placeholder = @"";
	[self addSubview:self.textView];
	self.backgroundColor = [UIColor whiteColor];
	self.layer.masksToBounds = YES;
	self.layer.cornerRadius = kCornerRadius;
}

- (id)initWithFrame:(CGRect)frame {
    if( (self = [super initWithFrame:frame])) {
		self.placeholder = @"";
		[self addSubview:self.textView];
		self.backgroundColor = [UIColor whiteColor];
		self.layer.masksToBounds = YES;
		self.layer.cornerRadius = kCornerRadius;
    }
    return self;
}

#pragma mark - Property Getter

- (void)setText:(NSString *)text {
	self.textView.text = text;
	[self setNeedsDisplay];
}

- (NSString *)text {
	return self.textView.text;
}

- (void)setSelectedRange:(NSRange)range {
	self.textView.selectedRange = range;
}

- (NSRange)selectedRange {
	return self.textView.selectedRange;
}

- (UITextView *)textView {
	if (_textView == nil) {
		_textView = [[UITextView alloc] initWithFrame:
					 CGRectMake(0,
								0,
								self.bounds.size.width,
								self.bounds.size.height - kTopMargin)];
		_textView.delegate = self;
		_textView.font = [_textView.font fontWithSize:kFontSize];
		_textView.backgroundColor = [UIColor clearColor];
		_textView.showsVerticalScrollIndicator = YES;
	}
	return _textView;
}

- (UILabel *)placeHolderLabel {
	if (_placeHolderLabel == nil) {
		_placeHolderLabel = [[UILabel alloc] initWithFrame:
							 CGRectMake(kLeftMargin,
										kTopMargin,
										self.bounds.size.width - 2 * kLeftMargin,
										0)];
		_placeHolderLabel.lineBreakMode = UILineBreakModeWordWrap;
		_placeHolderLabel.numberOfLines = 0;
		_placeHolderLabel.backgroundColor = [UIColor clearColor];
		_placeHolderLabel.textColor = [UIColor lightGrayColor];
		_placeHolderLabel.font = [self.textView.font fontWithSize:kFontSize];
		_placeHolderLabel.alpha = 0;
	}
	return _placeHolderLabel;
}

- (UILabel *)countLabel {
	if (_countLabel == nil) {
		_countLabel = [[UILabel alloc] initWithFrame:
							   CGRectMake(kLeftMargin,
										  self.textView.frame.origin.y + self.textView.frame.size.height - kCountLabelHeight + kTopMargin,
										  self.bounds.size.width - 2 * kLeftMargin,
										  kCountLabelHeight)];
		_countLabel.backgroundColor = [UIColor clearColor];
		_countLabel.font = [self.textView.font fontWithSize:kFontSize];
		_countLabel.alpha = 0.6;
		_countLabel.textAlignment = UITextAlignmentRight;
		_countLabel.text = [NSString stringWithFormat:@"%d/%d",
							self.maxNumberOfCharacter-self.textView.text.length, self.maxNumberOfCharacter];
	}
	return _countLabel;
}

- (void)drawRect:(CGRect)rect {
    if (self.placeholder.length > 0 ) {
        if (self.placeHolderLabel.superview == nil) {
            [self.textView addSubview:self.placeHolderLabel];
        }
		
        self.placeHolderLabel.text = self.placeholder;
        [self.placeHolderLabel sizeToFit];
        [self.textView sendSubviewToBack:self.placeHolderLabel];
		
		if(self.textView.text.length == 0) {
			self.placeHolderLabel.alpha = 1.f;
		} else {
			self.placeHolderLabel.alpha = 0.f;
		}
    } else {
		if (self.placeHolderLabel.superview != nil) {
			[self.placeHolderLabel removeFromSuperview];
		}
	}
	
	if (self.countLabel.superview == nil) {
		[self addSubview:self.countLabel];
	}
	
	if (self.textView.isFirstResponder) {
		self.countLabel.text = [NSString stringWithFormat:@"%d/%d",
								self.maxNumberOfCharacter-self.textView.text.length, self.maxNumberOfCharacter];
		self.countLabel.hidden = NO;
	} else {
		self.countLabel.hidden = YES;
	}
	
    [super drawRect:rect];
}


#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
	[self setNeedsDisplay];
	if ([self.delegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
		[self.delegate textViewDidBeginEditing:self];
	}
}

- (void)textViewDidChange:(UITextView *)textView {
	[self setNeedsDisplay];
	if ([self.delegate respondsToSelector:@selector(textViewDidChange:)]) {
		[self.delegate textViewDidChange:self];
	}
}

- (void)textViewDidEndEditing:(UITextView *)textView {
	[self setNeedsDisplay];
	if ([self.delegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
		[self.delegate textViewDidEndEditing:self];
	}
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	BOOL flag = YES;
	if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
		flag = [self.delegate textView:self shouldChangeTextInRange:range replacementText:text];
	}
	NSUInteger newLen = textView.text.length + text.length - range.length;
	return (self.maxNumberOfCharacter >= newLen) && flag;
}

#pragma mark - Override methods

- (BOOL)canBecomeFirstResponder {
	return [self.textView canBecomeFirstResponder];
}

- (BOOL)canResignFirstResponder {
	return [self.textView canResignFirstResponder];
}

- (BOOL)becomeFirstResponder {
	if ([self.textView becomeFirstResponder]) {
		[self setNeedsDisplay];
		return YES;
	}
	return NO;
}

- (BOOL)resignFirstResponder {
	if ([self.textView resignFirstResponder]) {
		[self setNeedsDisplay];
		return YES;
	}
	return NO;
}

@end
