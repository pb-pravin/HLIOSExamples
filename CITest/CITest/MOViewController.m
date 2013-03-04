//
//  MOViewController.m
//  CITest
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"

@interface MOViewController ()

@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSString *filePath =
	[[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"];
	NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
	
	CIImage *beginImage =
	[CIImage imageWithContentsOfURL:fileNameAndPath];
	CIContext *context = [CIContext contextWithOptions:nil];
	
	CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
								  keysAndValues: kCIInputImageKey, beginImage,
						@"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
	CIImage *outputImage = [filter outputImage];
	
	CGImageRef cgimg =
	[context createCGImage:outputImage fromRect:[outputImage extent]];
	UIImage *newImg = [UIImage imageWithCGImage:cgimg];
	
	[self.imgV setImage:newImg];
	
	CGImageRelease(cgimg);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
