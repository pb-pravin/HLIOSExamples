//
//  MOViewController.m
//  PlaceHolerTextView
//
//  Created by an hailin on 4/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "UICharCountingTextView.h"
#import "MOBadgeView.h"

@interface MOViewController () {
	UICharCountingTextView *pTextView;
}

@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	pTextView = [[[UICharCountingTextView alloc] initWithFrame:CGRectMake(8, 8, 300, 100)] autorelease];
	pTextView.placeholder = @"What do you think?";
	pTextView.maxNumberOfCharacter = 100;
	[self.view addSubview:pTextView];
	[pTextView setText:@"hello"];
	
	//for (int i=1; i<=10; i++) {
//	MOBadgeView *badgeView =
//	[[[MOBadgeView alloc] initWithFrame:CGRectMake(8, (20), 10, 17)] autorelease];
//	badgeView.badgeNumber = 1900000;
//	badgeView.badgeFont = [UIFont systemFontOfSize:13];
//	[self.view addSubview:badgeView];
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
