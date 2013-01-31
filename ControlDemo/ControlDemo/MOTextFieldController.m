//
//  MOTextFieldController.m
//  ControlDemo
//
//  Created by an hailin on 22/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOTextFieldController.h"

#define NUMBERS_ONLY @"1234567890"
#define CHARACTER_LIMIT 3

@interface MOTextFieldController ()

@end

@implementation MOTextFieldController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"TextField";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 44)];
    
    // Only work on IOS 6
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20.f], NSFontAttributeName,
                                 [UIColor blackColor], NSForegroundColorAttributeName,
                                [UIColor blueColor], NSBackgroundColorAttributeName,
                                [NSNumber numberWithFloat:10.f], NSKernAttributeName,
                                [NSNumber numberWithInt:NSUnderlineStyleSingle], NSUnderlineStyleAttributeName,
                                [NSNumber numberWithInt:NSUnderlineStyleSingle], NSStrikethroughStyleAttributeName,
                                [UIColor blackColor], NSStrokeColorAttributeName, nil];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Heloo" attributes:attributes];
    textField.attributedText = attributedString;
    textField.delegate = self;
    textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textField];
    
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, textField.frame.origin.y + textField.frame.size.height + 10, 300, 100)];
    textView.backgroundColor = [UIColor brownColor];
    textView.delegate = self;
    [self.view addSubview:textView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    NSLog(@"curentText: %@ length: %d", textField.text, textField.text.length);
    NSLog(@"rnage: %@", NSStringFromRange(range));
    NSLog(@"replacement: %@", string);
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    NSLog(@"new length: %d", newLength);
//    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS_ONLY] invertedSet];
//    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
//    return (([string isEqualToString:filtered])&&(newLength <= CHARACTER_LIMIT));
    return YES;
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
    return YES;
}

@end
