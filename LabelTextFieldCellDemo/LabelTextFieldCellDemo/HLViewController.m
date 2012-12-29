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

- (void)uploadAllPhoneNumbersInAddressBook:(ABAddressBookRef)addressbook {
    /** Retrive all phone numbers in the contacts.
     */
    CFRetain(addressbook);
    
    NSMutableSet *allPhoneNumbersInSet = [[NSMutableSet alloc] init];
    //NSMutableDictionary *contacts = [[NSMutableDictionary alloc] init];
    
    NSArray *people = (NSArray *)ABAddressBookCopyArrayOfAllPeople(addressbook);
    
    if (people) {
        for (int i=0; i<people.count; i++) {
            ABRecordRef aRecord = (ABRecordRef)[people objectAtIndex:i];
            
            // Retrive all the phone numbers in this record.
            ABMutableMultiValueRef allRecordNumbers = ABRecordCopyValue(aRecord, kABPersonPhoneProperty);
            CFStringRef name = ABRecordCopyCompositeName(aRecord);
            NSLog(@"====== name:%@ ======", name);
            CFRelease(name);
            CFIndex countOfNumbers = ABMultiValueGetCount(allRecordNumbers);
            for (int j=0; j<countOfNumbers; j++) {
                CFStringRef aPhoneNumber = ABMultiValueCopyValueAtIndex(allRecordNumbers, j);
                NSLog(@"%@", aPhoneNumber);
                [allPhoneNumbersInSet addObject:(NSString *)aPhoneNumber];
                CFRelease(aPhoneNumber);
            }
            CFRelease(allRecordNumbers);
        }
    } else {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"Could not read people records from addressbook", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:nil] show];
    }
    
    CFRelease(addressbook);
    
    // Store all the phone numbers in an array.
    NSMutableArray *allPhoneNumbersInArray = [[NSMutableArray alloc] initWithCapacity:allPhoneNumbersInSet.count];
    for (NSString *phoneNumber in allPhoneNumbersInSet) {
        [allPhoneNumbersInArray addObject:phoneNumber];
        
    }
    [allPhoneNumbersInArray release];
    [allPhoneNumbersInSet release];
    //[contacts release];
}

- (void)loadView
{
    [super loadView];
    NSLog(@"loadView");
}

+ (void)initialize
{
    NSLog(@"initialize");
}

+ (void)load
{
    NSLog(@"load");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    
    [self.view addSubview:[self buttonWithTitle:@"Hello helasdfja;sdjfkl;a"]];
    
    
    
    // Change the background image of UISearchBar
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    int count = 1;
    for (UIView *subview in searchBar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            UIView *bg = [[UIView alloc] initWithFrame:subview.frame];
            bg.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"SearchBarBackground.png"]];
            [searchBar insertSubview:bg aboveSubview:subview];
            [subview removeFromSuperview];
        }
        NSLog(@"subview %d : %@", count++, subview);
    }
    
    // Demo how to access address book
    ABAddressBookRef addressBookRef = ABAddressBookCreate();
    //__block BOOL accessGranted = NO;
    if (ABAddressBookRequestAccessWithCompletion != NULL) { // we're on iOS 6
        // Check the authorization status.
        if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
            CFRetain(addressBookRef);
            ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
                // Save the user's choice. granted or not granted.
                //accessGranted = granted;
                if (granted) {
                    [self uploadAllPhoneNumbersInAddressBook:addressBookRef];
                }
                CFRelease(addressBookRef); 
            });
        }
        else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
            // The user has previously given access, add the contact
            //accessGranted = YES;
            [self uploadAllPhoneNumbersInAddressBook:addressBookRef];
        }
        else {
            // The user has previously denied access
            // Send an alert telling user to change privacy setting in settings app, UI operation should be run on main thread.
            //accessGranted = NO;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Tip", nil)
                                            message:NSLocalizedString(@"Deja could not access the contacts, please go to 'Settings>Privacy' to grant Deja the access right.", nil)
                                           delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
            });
        }
    }
    else { // we're on iOS 5 or older
        //accessGranted = YES;
        // By default, on IOS5, we have the right to access address book.
        [self uploadAllPhoneNumbersInAddressBook:addressBookRef];
    }
    
    if (addressBookRef != NULL) {
        CFRelease(addressBookRef);
    }
    
    [self.view addSubview:searchBar];
    [searchBar release];
    
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
