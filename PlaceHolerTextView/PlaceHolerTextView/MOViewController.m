//
//  MOViewController.m
//  PlaceHolerTextView
//
//  Created by an hailin on 4/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "UIPlaceHolderTextView.h"
#import <QuartzCore/CALayer.h>
#import "MOBadgeView.h"

@interface MOViewController () {
	UIPlaceHolderTextView *pTextView;
}

@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//	pTextView = [[[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(8, 8, 300, 100)] autorelease];
//	pTextView.placeholder = @"What do you think?";
//	pTextView.maxNumberOfCharacter = 100;
//	pTextView.layer.cornerRadius = 8;
//	pTextView.delegate = self;
//	[self.view addSubview:pTextView];
//	pTextView.multipleTouchEnabled = YES;
//	NSLog(@"window: %@", pTextView.window);
//	//[pTextView removeFromSuperview];
//	NSLog(@"nextResponder: %@", pTextView.nextResponder);
//	NSLog(@"self.view: %@", self.view);
//	NSLog(@"self.view.nextResponder: %@", self.view.nextResponder);
//	NSLog(@"self: %@", self);
//	NSLog(@"self.nextResponder: %@", self.nextResponder);
	
	
	//for (int i=1; i<=10; i++) {
	MOBadgeView *badgeView =
	[[[MOBadgeView alloc] initWithFrame:CGRectMake(8, (20), 10, 17)] autorelease];
	badgeView.badgeNumber = 1900000;
	badgeView.badgeFont = [UIFont systemFontOfSize:13];
	[self.view addSubview:badgeView];
	//}
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    
    NSLog(@"curentText: %@ length: %d", textView.text, textView.text.length);
    NSLog(@"rnage: %@", NSStringFromRange(range));
    NSLog(@"replacement: %@", text);
    NSUInteger newLength = [textView.text length] + [text length] - range.length;
    NSLog(@"new length: %d", newLength);
    //    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS_ONLY] invertedSet];
    //    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    //    return (([string isEqualToString:filtered])&&(newLength <= CHARACTER_LIMIT));
    
	return newLength <= 100;
}

@end
