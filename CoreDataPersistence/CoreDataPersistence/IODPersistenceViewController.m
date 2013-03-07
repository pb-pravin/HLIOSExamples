//
//  IODPersistenceViewController.m
//  CoreDataPersistence
//
//  Created by an hailin on 3/7/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "IODPersistenceViewController.h"
#import "IODAppDelegate.h"

@interface IODPersistenceViewController ()
@property (retain, nonatomic) IBOutlet UITextField *field1;
@property (retain, nonatomic) IBOutlet UITextField *field2;
@property (retain, nonatomic) IBOutlet UITextField *field3;
@property (retain, nonatomic) IBOutlet UITextField *field4;
@end

@implementation IODPersistenceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    IODAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Line" inManagedObjectContext:context];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
