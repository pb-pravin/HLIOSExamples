//
//  MOButtonDemo2Controller.m
//  ControlDemo
//
//  Created by an hailin on 12/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOButtonDemo2Controller.h"
#import "MOBarButtonItem.h"

@interface MOButtonDemo2Controller ()

@end

@implementation MOButtonDemo2Controller

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Video Title";
    }
    return self;
}

- (IBAction)buttonPressed:(id)sender {
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // The width of back bar button item could be automatically adjusted by its title.
    self.navigationItem.leftBarButtonItem = [[MOBarButtonItem alloc]
                                             initBackBarButtonItemWithTitle:@"Youtube Videos" target:self action:@selector(buttonPressed:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
