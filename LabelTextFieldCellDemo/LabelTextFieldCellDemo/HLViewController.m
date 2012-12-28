//
//  HLViewController.m
//  LabelTextFieldCellDemo
//
//  Created by an hailin on 28/12/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import "HLViewController.h"


@interface HLViewController ()

@end

@implementation HLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view addSubview:[self buttonWithTitle:@"Hello helasdfja;sdjfkl;a"]];
    
    
}

- (void)modalViewController:(MOModalViewController *)controller
                    DidEdit:(NSString *)result
{
    NSLog(@"%@", result);
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)pressed:(id)sender {
    
    
    MOModalViewController *controller = [[MOModalViewController alloc] init];
    controller.delegate = self;
    [self presentModalViewController:controller animated:YES];
    
    
    
}

- (UIButton *)buttonWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultBack.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0] forState:UIControlStateNormal];
    [btn setBackgroundImage:[[UIImage imageNamed:@"NavBarDefaultBackPressed.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0] forState:UIControlStateHighlighted];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    CGRect frame = btn.frame;
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    CGSize titleSize = [title sizeWithFont:btn.titleLabel.font constrainedToSize:CGSizeMake(160, frame.size.height)];
    frame.size.width = 18 + titleSize.width;
    btn.frame = frame;
    NSLog(@"%@", btn.titleLabel);
    btn.titleLabel.frame = CGRectMake(150, 7, titleSize.width, titleSize.height);
    
    
    [btn addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"%@", btn.titleLabel);
    
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return btn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
