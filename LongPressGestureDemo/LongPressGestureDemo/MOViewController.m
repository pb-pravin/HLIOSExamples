//
//  MOViewController.m
//  LongPressGestureDemo
//
//  Created by an hailin on 21/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"

@interface MOViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *imageView1;
@property (retain, nonatomic) IBOutlet UIImageView *imageView2;
@property (retain, nonatomic) IBOutlet UIImageView *imageView3;
@property (retain, nonatomic) IBOutlet UIImageView *imageView4;
@property (retain, nonatomic) IBOutlet UIImageView *imageView5;
@property (retain, nonatomic) IBOutlet UIImageView *imageView6;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UILongPressGestureRecognizer *longPressGesture1 = [[UILongPressGestureRecognizer alloc]
													   initWithTarget:self action:@selector(pressed1:)];
	// The minimum period fingers must press on the view for gesture to be recognzied.
	// the time interval is in seconds, and the default duration is 0.5 seconds.
	longPressGesture1.minimumPressDuration = 1.0;
	[self.imageView1 addGestureRecognizer:longPressGesture1];
	[longPressGesture1 release];
	
	UILongPressGestureRecognizer *longPressGesture2 = [[UILongPressGestureRecognizer alloc]
													   initWithTarget:self action:@selector(pressed2:)];
	// The number of fingers that must pressed on the view for the gesture to be recognized.
	// The default number of fingers is 1.
	longPressGesture2.numberOfTouchesRequired = 2;
	[self.imageView2 addGestureRecognizer:longPressGesture2];
	[longPressGesture2 release];
	
	UILongPressGestureRecognizer *longPressGesture3 = [[UILongPressGestureRecognizer alloc]
													   initWithTarget:self action:@selector(pressed3:)];
	// The number of taps required for the gesture to be required.
	// The default number of taps is 0.
	longPressGesture3.numberOfTapsRequired = 2;
	[self.imageView3 addGestureRecognizer:longPressGesture3];
	[longPressGesture3 release];
	
	UILongPressGestureRecognizer *longPressGesture4 = [[UILongPressGestureRecognizer alloc]
													   initWithTarget:self action:@selector(pressed4:)];
	// The maximum movement of the fingers on the view before the gesture fails.
	// The allowable distance is in pixels, the default distance is 10 pixels.
	longPressGesture4.allowableMovement = 20;
	[self.imageView4 addGestureRecognizer:longPressGesture4];
	[longPressGesture4 release];
	
	UILongPressGestureRecognizer *longPressGesture5 = [[UILongPressGestureRecognizer alloc]
													   initWithTarget:self action:@selector(pressed5:)];
	
	[self.imageView5 addGestureRecognizer:longPressGesture5];
	[longPressGesture5 release];
	
	UILongPressGestureRecognizer *longPressGesture6 = [[UILongPressGestureRecognizer alloc]
													   initWithTarget:self action:@selector(pressed6:)];
	
	[self.imageView6 addGestureRecognizer:longPressGesture6];
	[longPressGesture6 release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (IBAction)pressed1:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed1 starded");
	} else if (sender.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed1 ended");
	}
}

- (IBAction)pressed2:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed2 starded");
	} else if (sender.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed2 ended");
	}
}

- (IBAction)pressed3:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed3 starded");
	} else if (sender.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed3 ended");
	}
}

- (IBAction)pressed4:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed4 starded");
	} else if (sender.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed4 ended");
	}
}

- (IBAction)pressed5:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed5 starded");
	} else if (sender.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed5 ended");
	}
}

- (IBAction)pressed6:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan) {
		NSLog(@"pressed6 starded");
	} else if (sender.state == UIGestureRecognizerStateEnded) {
		NSLog(@"pressed6 ended");
	}
}

@end
