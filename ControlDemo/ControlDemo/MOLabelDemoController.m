//
//  MOViewController.m
//  ControlDemo
//
//  Created by an hailin on 10/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOLabelDemoController.h"
#import <QuartzCore/QuartzCore.h>

@interface MOLabelDemoController ()

@end

@implementation MOLabelDemoController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Label";
    }
    return self;
}

// This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
// Half diclosure to client developer.
- (void)loadView
{
    [super loadView];
    
    // Demo the corner radius usage
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 30)];
    label1.textAlignment = UITextAlignmentCenter;
    label1.backgroundColor = [UIColor greenColor];
    label1.text = @"Hello, World";
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, label1.frame.origin.y + label1.frame.size.height + 5, 300, 30)];
    label2.textAlignment = UITextAlignmentCenter;
    label2.backgroundColor = [UIColor blueColor];
    label2.layer.cornerRadius = 6;
    label2.text = @"Hello, World";
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, label2.frame.origin.y + label2.frame.size.height + 5, 300, 30)];
    label3.textAlignment = UITextAlignmentCenter;
    label3.backgroundColor = [UIColor redColor];
    label3.layer.cornerRadius = 15;
    label3.text = @"Hello, World";
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, label3.frame.origin.y + label3.frame.size.height + 5, 300, 30)];
    label4.textAlignment = UITextAlignmentCenter;
    label4.backgroundColor = [UIColor brownColor];
    label4.layer.cornerRadius = 30;
    label4.text = @"Hello, World";
    [self.view addSubview:label4];
    
    // height of label5 could be automatic adjusted by its content.
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(10, label4.frame.origin.y + label4.frame.size.height + 5, 120, 200)];
    //label5.textAlignment = UITextAlignmentCenter;
    label5.backgroundColor = [UIColor lightGrayColor];
    label5.layer.cornerRadius = 6;
    label5.text = @"Hello, WorldHello, WorldHello, WorldHello, WorldHello, ";
    label5.numberOfLines = 0;
    CGSize size = [label5.text sizeWithFont:label5.font constrainedToSize:CGSizeMake(120, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    label5.frame = CGRectMake(label5.frame.origin.x, label5.frame.origin.y, size.width, size.height);
    [self.view addSubview:label5];
    
    // Message bubble
    UIImage *_messageBubbleGray = [[UIImage imageNamed:@"MessageBubbleGray"] stretchableImageWithLeftCapWidth:23 topCapHeight:15];
    UIImageView *messageBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    messageBackgroundImageView.frame = CGRectMake(label5.frame.origin.x+label5.frame.size.width+10, label5.frame.origin.y, 120+34, 50+12);
    messageBackgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    messageBackgroundImageView.image = _messageBubbleGray;
    [self.view addSubview:messageBackgroundImageView];  

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
