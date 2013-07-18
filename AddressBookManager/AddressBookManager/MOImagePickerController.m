//
//  MOViewController.m
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "MOABManager.h"

@interface MOImagePickerController ()

@end

@implementation MOImagePickerController

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

- (IBAction)checkAddressBookAuthorizationStatus:(id)sender {
    NSLog(@"address book authorization status: %ld", ABAddressBookGetAuthorizationStatus());
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
