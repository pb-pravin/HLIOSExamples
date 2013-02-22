//
//  MOViewController.m
//  TapGestureDemo
//
//  Created by an hailin on 22/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"

@interface MOViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *imageView1;
@property (retain, nonatomic) IBOutlet UIImageView *imageView2;
@property (retain, nonatomic) IBOutlet UIImageView *imageView3;
@property (retain, nonatomic) IBOutlet UIImageView *imageView4;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc]
										   initWithTarget:self action:@selector(pressed1:)];

	// The number of taps required for the gesture to be recognized.
	// The default value is 1.
	tapGesture1.numberOfTapsRequired = 2;
	[self.imageView1 addGestureRecognizer:tapGesture1];
	[tapGesture1 release];
	
	UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc]
										   initWithTarget:self action:@selector(pressed2:)];
	// The number of fingers required to tap for the gesture to be recognized.
	// The default value is 1.
	tapGesture2.numberOfTouchesRequired = 2;
	[self.imageView2 addGestureRecognizer:tapGesture2];
	[tapGesture2 release];
	
	UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc]
										   initWithTarget:self action:@selector(pressed3:)];
	[self.imageView3 addGestureRecognizer:tapGesture3];
	[tapGesture3 release];
	
	UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc]
										   initWithTarget:self action:@selector(pressed4:)];
	[self.imageView4 addGestureRecognizer:tapGesture4];
	[tapGesture4 release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressed1:(UITapGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateEnded) {
		// a generic single-point location of the gesture, usually the centeroid of the touches involved. 
		CGPoint point = [sender locationInView:self.imageView1];
		NSLog(@"point: x:%f y:%f", point.x, point.y);
		NSLog(@"pressed1 starded");
	}
}

- (IBAction)pressed2:(UITapGestureRecognizer *)sender
{
	UITapGestureRecognizer *recognizer = (UITapGestureRecognizer *)sender;
	if (recognizer.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed2 starded");
	} else if (recognizer.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed2 ended");
	}
}

- (IBAction)pressed3:(UITapGestureRecognizer *)sender
{
	UITapGestureRecognizer *recognizer = (UITapGestureRecognizer *)sender;
	if (recognizer.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed3 starded");
	} else if (recognizer.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed3 ended");
	}
}

- (IBAction)pressed4:(UITapGestureRecognizer *)sender
{
	UITapGestureRecognizer *recognizer = (UITapGestureRecognizer *)sender;
	if (recognizer.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed4 starded");
	} else if (recognizer.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed4 ended");
	}
}

@end
