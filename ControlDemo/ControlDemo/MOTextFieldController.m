//
//  MOTextFieldController.m
//  ControlDemo
//
//  Created by an hailin on 22/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "MOTextFieldController.h"

@interface MOTextFieldController ()

@end

@implementation MOTextFieldController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"TextField";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 44)];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20.f], NSFontAttributeName,
                                [UIColor blackColor], NSForegroundColorAttributeName,
                                [UIColor blueColor], NSBackgroundColorAttributeName,
                                [NSNumber numberWithFloat:10.f], NSKernAttributeName,
                                [NSNumber numberWithInt:NSUnderlineStyleSingle], NSUnderlineStyleAttributeName,
                                [NSNumber numberWithInt:NSUnderlineStyleSingle], NSStrikethroughStyleAttributeName,
                                [UIColor blackColor], NSStrokeColorAttributeName, nil];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Heloo" attributes:attributes];
    textField.attributedText = attributedString;
    
    textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
