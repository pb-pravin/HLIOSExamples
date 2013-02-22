//
//  MOHUDViewController.m
//  HUDDemo
//
//  Created by an hailin on 8/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOHUDViewController.h"

@interface MOHUDViewController ()

@end

@implementation MOHUDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"HUD View";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
    HUD.delegate = self;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.labelText = NSLocalizedString(@"Loading...", @"");
    [HUD show:YES];
    
    [HUD hide:YES afterDelay:3];
    [self retain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    [self release];
    [hud removeFromSuperview];
    [hud release];
}

@end
