//
//  MOViewController.m
//  WebViewDemo
//
//  Created by an hailin on 9/4/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"

// Define the class that could carry an url object.
@interface URLOpeningAlertView : UIAlertView
@property (nonatomic, retain) NSURL *url;
@end

@implementation URLOpeningAlertView
@end


@interface MOViewController ()
@property (nonatomic, retain) IBOutlet UIWebView *webView;
- (IBAction)loadConent:(id)sender;
@end

@implementation MOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)loadConent:(id)sender {
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DejaWeb"
														 ofType:@"html"
													inDirectory:@"DejaWeb"];
	NSURL *url = [NSURL fileURLWithPath:filePath];
	[self.webView loadRequest:[NSURLRequest requestWithURL:url]];
	self.webView.delegate = self;
	self.webView.scalesPageToFit = NO;
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
	NSURL *url = [request URL];
	NSString *msg = [NSString stringWithFormat:@"Do you want to open %@", url];
	URLOpeningAlertView *alert = [[URLOpeningAlertView alloc] initWithTitle:@"Tip"
																	message:msg
																   delegate:self
														  cancelButtonTitle:@"Cancel"
														  otherButtonTitles:@"OK", nil];
	alert.url = url;
	[alert show];
	return NO;
}

- (void)alertView:(URLOpeningAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (buttonIndex == alertView.cancelButtonIndex) {
		NSLog(@"You pressed cancel open %@", alertView.url);
	} else if (buttonIndex == alertView.firstOtherButtonIndex) {
		NSLog(@"You pressed open %@", alertView.url);
		
	}
}

@end
