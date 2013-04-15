//
//  MOViewController.m
//  WebViewDemo
//
//  Created by an hailin on 9/4/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"

@interface MOViewController ()
@property (nonatomic, retain) IBOutlet UIWebView *webView;
- (IBAction)loadConent:(id)sender;
@end

@implementation MOViewController

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

- (IBAction)loadConent:(id)sender {
//	NSURL *url = [[NSBundle mainBundle] URLForResource:@"DejaWeb" withExtension:@"html"];
//	NSString *html = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
//	NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
//	[self.webView loadHTMLString:html baseURL:baseUrl];
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"DejaWeb" ofType:@"html" inDirectory:@"DejaWeb"]];
	//NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
	[self.webView loadRequest:[NSURLRequest requestWithURL:url]];
	self.webView.delegate = self;
	self.webView.scalesPageToFit = YES;

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

	NSURL *url = [request URL];
	NSLog(@"%@", url);
	if ([[url scheme] isEqualToString:@"block"]) {
		// do the your blocking code here
		return NO;
	}
	
	return YES;
}

@end
