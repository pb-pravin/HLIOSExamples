//
//  MOViewController.m
//  HUDDemo
//
//  Created by an hailin on 8/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "MOHUDViewController.h"


@interface MOViewController ()
- (IBAction)buttonPressed:(id)sender;
- (IBAction)doTask:(id)sender;
- (IBAction)doTask:(id)sender;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"HUDDemo";
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonPressed:(id)sender {
    MOHUDViewController *hudViewController = [[[MOHUDViewController alloc] initWithNibName:@"MOHUDViewController" bundle:nil] autorelease];
    
    [self.navigationController pushViewController:hudViewController animated:YES];
}

- (IBAction)doTask:(id)sender {
}

- (IBAction)doTask:(id)sender {
}

- (void)dealloc {
    [_field1 release];
    [_field2 release];
    [_field3 release];
    [_field4 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setField1:nil];
    [self setField2:nil];
    [self setField3:nil];
    [self setField4:nil];
    [self setStartBtn:nil];
    [self setResultLabel:nil];
    [self setTaskIndicator:nil];
    [super viewDidUnload];
}
@end
