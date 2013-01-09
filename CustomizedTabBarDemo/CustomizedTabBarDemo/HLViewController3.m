//
//  HLViewController3.m
//  CustomizedTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "HLViewController3.h"

@interface HLViewController3 ()

@end

@implementation HLViewController3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"View3" image:[UIImage imageNamed:@"TabIconChats.png"] tag:3] autorelease];
        //self.tabBarItem.badgeValue = @"1234567890";
        
        //[self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"TabIconChatsActive.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"TabIconChats.png"]];

    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 40)];
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"View III";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
