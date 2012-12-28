//
//  HLFlipsideViewController.m
//  UtilityApp
//
//  Created by an hailin on 12/28/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import "HLFlipsideViewController.h"

@interface HLFlipsideViewController ()

@end

@implementation HLFlipsideViewController

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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
