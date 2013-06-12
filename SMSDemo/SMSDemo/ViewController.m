//
//  ViewController.m
//  SMSDemo
//
//  Created by an hailin on 31/5/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Hi, all
//
//It seems it's a bug in the iOS 5 and later simulator. canSendTextshould returns NO in the simulator. Many other people encountered the same issue.
//
//Please refer to the following page for detail information.
//
//http://stackoverflow.com/questions/9349381/mfmessagecomposeviewcontroller-on-simulator-cansendtext
//
//Best regards
//Hailin

- (IBAction)sendSMS:(id)sender
{
    if ([MFMessageComposeViewController canSendText])
    {
        MFMessageComposeViewController *smsController = [[MFMessageComposeViewController alloc] init];
		
        smsController.navigationBar.barStyle = UIBarStyleDefault;
		
        smsController.topViewController.navigationItem.prompt = NSLocalizedString(@"Please send without modification.", @"");
		
        smsController.messageComposeDelegate = self;
		
        smsController.recipients = [NSArray arrayWithObjects:@"+65 73000000", @"+65 73000001", nil];
		
        NSString *aBody = NSLocalizedString(@"Invite you to join Deja!", @"");
        smsController.body = aBody;
		
        smsController.view.backgroundColor = [UIColor whiteColor];
		
        [self presentModalViewController:smsController animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"SMS Not Supported", "")
                                                        message:NSLocalizedString(@"Sending SMS with apps is not supported on this iOS version. Please upgrade your iOS or send invitation manually.", @"")
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                              otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark -

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
