//
//  HLViewController.m
//  TextFieldCellDemo
//
//  Created by an hailin on 2/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "HLViewController.h"


@interface HLViewController () {
	MOModalViewController *modalViewController;
}
@property (nonatomic, retain) MOModalViewController *modalViewController;
@end

@implementation HLViewController
@synthesize modalViewController = _modalViewController;

- (void)dealloc {
	self.modalViewController = nil;
	[super dealloc];
}

- (MOModalViewController *)modalViewController {
	if (_modalViewController == nil) {
		_modalViewController = [[MOModalViewController alloc] init];
		_modalViewController.delegate = self;
		NSLog(@"#1ref count: %d", _modalViewController.retainCount);
	}
	return _modalViewController;
}

- (IBAction)imageTapped:(id)sender
{
	NSLog(@"#2ref count: %d", _modalViewController.retainCount);
    [self presentModalViewController:self.modalViewController animated:YES];
	NSLog(@"#3ref count: %d", _modalViewController.retainCount);
}

- (void)modalViewController:(MOModalViewController *)controller
                    DidEdit:(NSString *)result
{
    NSLog(@"#4ref count: %d", _modalViewController.retainCount);
	[self dismissModalViewControllerAnimated:YES];
	
	[NSThread sleepForTimeInterval:5];
	
	NSLog(@"#5ref count: %d", _modalViewController.retainCount);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    imageView.frame = CGRectMake((320 - image.size.width)/2, ([UIScreen mainScreen].bounds.size.height - image.size.height)/2, image.size.width, image.size.height);
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)] autorelease];
    [imageView addGestureRecognizer:tap];
    [self.view addSubview:imageView];
    
    // Long press test
    imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    imageView.frame = CGRectMake((320 - image.size.width)/2, ([UIScreen mainScreen].bounds.size.height - image.size.height)/2 - image.size.height, image.size.width, image.size.height);
    imageView.userInteractionEnabled = YES;

    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(imageLongPressed:)];
    longPressGesture.minimumPressDuration = 1.0;
    [imageView addGestureRecognizer:longPressGesture];
    [longPressGesture release];
    [self.view addSubview:imageView];
}

- (IBAction)imageLongPressed:(id)sender
{
    UILongPressGestureRecognizer *guestureRecognizer = (UILongPressGestureRecognizer *)sender;

    if (guestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"UIGestureRecognizerStateBegan.");
        //Do Whatever You want on Began of Gesture
    } else if (guestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
        //Do Whatever You want on End of Gesture
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
	NSLog(@"#1 receive memory warning.");
	self.modalViewController = nil;
//	NSLog(@"#6ref count: %d", _modalViewController.retainCount);
}

@end
