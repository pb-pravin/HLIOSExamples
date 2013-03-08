//
//  MOViewController.m
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "MOABManager.h"

@interface MOViewController ()

@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 10, 100, 44);
    [btn setTitle:@"Check" forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(checkAddressBookAuthorizationStatus:)
  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

/**********************************************************
 typedef CF_ENUM(CFIndex, ABAuthorizationStatus) {
     kABAuthorizationStatusNotDetermined = 0,
     kABAuthorizationStatusRestricted,
     kABAuthorizationStatusDenied,
     kABAuthorizationStatusAuthorized
 };
 **********************************************************/
- (IBAction)checkAddressBookAuthorizationStatus:(id)sender {
    NSLog(@"address book authorization status: %ld", ABAddressBookGetAuthorizationStatus());
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
