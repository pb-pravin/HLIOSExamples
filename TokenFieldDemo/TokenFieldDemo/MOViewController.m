//
//  MOViewController.m
//  TokenFieldDemo
//
//  Created by an hailin on 19/6/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "MOTokenField.h"

@interface MOViewController ()

@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	MOTokenField *tokenField = [[[MOTokenField alloc] initWithFrame:CGRectMake(0, 10, 320, 50)] autorelease];
	[self.view addSubview:tokenField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
