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

@end
