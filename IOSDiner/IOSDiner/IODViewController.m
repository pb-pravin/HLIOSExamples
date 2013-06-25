//
//  IODViewController.m
//  IOSDiner
//
//  Created by an hailin on 1/23/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "IODViewController.h"

@interface IODViewController ()

@end

@implementation IODViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft;
}

- (void)viewDidUnload {
    [self setIbRemoveItemButton:nil];
    [self setIbAddItemButton:nil];
    [self setIbPreviousItemButton:nil];
    [self setIbNextItemButton:nil];
    [self setIbTotalOrderButton:nil];
    [self setIbChalkboardLabel:nil];
    [self setIbCurrentItemImageView:nil];
    [self setIbCurrentItemLabel:nil];
    [super viewDidUnload];
}
- (IBAction)ibaRemoveItem:(id)sender {
}

- (IBAction)ibaAddItem:(id)sender {
}

- (IBAction)ibaLoadPreviousItem:(id)sender {
}

- (IBAction)ibaLoadNextItem:(id)sender {
}

- (IBAction)ibaCalculateTotal:(id)sender {
}
@end
