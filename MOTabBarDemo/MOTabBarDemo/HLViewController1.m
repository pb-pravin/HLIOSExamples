//
//  HLViewController1.m
//  CustomizedTabBarDemo
//
//  Created by an hailin on 7/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "HLViewController1.h"

@interface HLViewController1 ()

@end

@implementation HLViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 40)];
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"View I";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
	
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
	NSString *bgImageName = @"TabBackground.png";
//		bgImageName = @"TabBackgroundActive.png";
	
	UIImage *bgImage = [[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
	[btn setBackgroundImage:bgImage forState:UIControlStateNormal];
	[btn setImage:[UIImage imageNamed:@"TabIconChats.png"] forState:UIControlStateNormal];
	[self.view addSubview:btn];
}

- (NSString *)iconImageName {
	return @"TabIconChats.png";
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
