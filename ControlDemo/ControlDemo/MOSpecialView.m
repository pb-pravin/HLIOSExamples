//
//  MOSpecialView.m
//  ControlDemo
//
//  Created by an hailin on 5/3/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOSpecialView.h"

@implementation MOSpecialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
		[btn setTitle:@"Hello" forState:UIControlStateNormal];
		btn.backgroundColor = [UIColor blueColor];
		[btn addTarget:self action:@selector(resign:) forControlEvents:UIControlEventTouchUpInside];
		self.inputView = btn;
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
		label.text = @"Start";
		label.backgroundColor = [UIColor greenColor];
		self.inputAccessoryView = label;
		self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

}
 */



- (void)resign:(id)sender {
	[self resignFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}

- (BOOL)becomeFirstResponder {
	// Update the view's status.
	self.backgroundColor = [UIColor redColor];
	return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
	// Update the view's status.
	self.backgroundColor = [UIColor blackColor];
	return [super resignFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self becomeFirstResponder];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	NSLog(@"hello, shake started");
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	NSLog(@"hello, shake ended");	
}

@end
