//
//  MOViewController.m
//  SlowWorker
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"

@interface MOImagePickerController ()
@property (strong, nonatomic) IBOutlet UIButton *startBtn;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *taskIndicator;

- (IBAction)doTask:(id)sender;

@end

@implementation MOImagePickerController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doTask:(id)sender {
	self.startBtn.enabled = NO;
	self.startBtn.alpha = 0.5;
	[self.taskIndicator startAnimating];
	
	NSDate *start = [NSDate date];
	
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		NSString *data = [self fetchData];
		NSString *processed = [self processData:data];
		__block NSString *result1;
		__block NSString *result2;
		dispatch_group_t group = dispatch_group_create();
		dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
			result1 = [self parseResult1FromString:processed];
		});
		dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
			result2 = [self parseResult2FromString:processed];
		});
		dispatch_group_notify(group, dispatch_get_main_queue(), ^{
			NSString *resutl = [NSString stringWithFormat:@"%@\n%@", result1, result2];
			//[resutl release];
			//[result2 release];
			NSDate *end = [NSDate date];
			NSLog(@"time: %g seconds", [end timeIntervalSinceDate:start]);
			
			self.resultLabel.text = resutl;
			self.startBtn.enabled = YES;
			self.startBtn.alpha = 1.0;
			[self.taskIndicator stopAnimating];
		});
		// Must release the group, otherwise will leak memory.
		dispatch_release(group);
	});
}

- (NSString *)fetchData {
	[NSThread sleepForTimeInterval:3];
	return @"Hello Kitty";
}

- (NSString *)processData:(NSString *)str {
	[NSThread sleepForTimeInterval:3];
	return [str lowercaseString];
}

- (NSString *)parseResult1FromString:(NSString *)str {
	[NSThread sleepForTimeInterval:3];
	return [str stringByReplacingOccurrencesOfString:@"kitty" withString:@"Hailin"];
}

- (NSString *)parseResult2FromString:(NSString *)str {
	[NSThread sleepForTimeInterval:3];
	return [str stringByReplacingOccurrencesOfString:@"hello" withString:@"Welcome"];
}

@end
