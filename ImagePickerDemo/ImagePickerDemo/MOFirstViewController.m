//
//  MOFirstViewController.m
//  ImagePickerDemo
//
//  Created by an hailin on 9/4/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOFirstViewController.h"
#import "MOViewController.h"

@interface MOFirstViewController ()
- (IBAction)showModalView:(id)sender;
- (IBAction)hideModalView:(id)sender;
@end

@implementation MOFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showModalView:(id)sender {
	MOViewController *viewController = [[[MOViewController alloc] initWithNibName:@"MOViewController" bundle:nil] autorelease];
	[self presentModalViewController:viewController animated:YES];
}



@end
