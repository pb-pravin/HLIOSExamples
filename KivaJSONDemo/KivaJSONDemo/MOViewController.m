//
//  MOViewController.m
//  KivaJSONDemo
//
//  Created by an hailin on 26/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"] //2

@interface MOViewController ()
@property (strong, nonatomic) IBOutlet UILabel *humanReadable;
@property (strong, nonatomic) IBOutlet UILabel *jsonSummary;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:
						kLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
							   withObject:data waitUntilDone:YES];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
						  JSONObjectWithData:responseData //1
						  options:kNilOptions
						  error:&error];
	
    NSArray* latestLoans = [json objectForKey:@"loans"]; //2
	
    NSLog(@"loans: %@", latestLoans); //3
	
	// 1) Get the latest loan
	NSDictionary* loan = [latestLoans objectAtIndex:0];
	
	// 2) Get the funded amount and loan amount
	NSNumber* fundedAmount = [loan objectForKey:@"funded_amount"];
	NSNumber* loanAmount = [loan objectForKey:@"loan_amount"];
	float outstandingAmount = [loanAmount floatValue] -	[fundedAmount floatValue];
	
	// 3) Set the label appropriately
	self.humanReadable.text = [NSString stringWithFormat:@"Latest loan: %@ from %@ needs another $%.2f to pursue their entrepreneural dream",
						 [loan objectForKey:@"name"],
						 [(NSDictionary*)[loan objectForKey:@"location"]
						  objectForKey:@"country"],
						 outstandingAmount];
	
	//build an info object and convert to json
	NSDictionary* info = [NSDictionary dictionaryWithObjectsAndKeys:
						  [loan objectForKey:@"name"],
						  @"who",
						  [(NSDictionary*)[loan objectForKey:@"location"]
						   objectForKey:@"country"],
						  @"where",
						  [NSNumber numberWithFloat: outstandingAmount],
						  @"what",
						  nil];
	
	//convert object to data
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:info
													   options:NSJSONWritingPrettyPrinted error:&error];
	
	//print out the data contents
	self.jsonSummary.text = [[NSString alloc] initWithData:jsonData
											 encoding:NSUTF8StringEncoding];
}

@end
