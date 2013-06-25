//
//  FCViewController.m
//  FakeContactsGenerator
//
//  Created by an hailin on 29/5/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "FCViewController.h"
#import "MOABHelper.h"

@interface FCViewController ()
@property (nonatomic, strong) IBOutlet UILabel *numOfContactsLabel;
@property (nonatomic, strong) IBOutlet UILabel *numOfFakeContactsLabel;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) IBOutlet UIButton *generateBtn;
@property (nonatomic, strong) IBOutlet UIButton *removeBtn;
@property (nonatomic, strong) NSArray *phoneNumbers;
@end

@implementation FCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"phoneNumbers" ofType:nil];
	NSError *error;
	NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
	self.phoneNumbers = [str componentsSeparatedByString:@","];
	NSLog(@"Load %d phone numbers from file.", self.phoneNumbers.count);
	
	
	[MOABHelper requestAccessWithCompletion:^(bool granted, CFErrorRef error)
	 {
		 NSLog(@"address book granted=%d", granted);
		 dispatch_async(dispatch_get_main_queue(), ^{
			 [self refreshLabelValues];
		 });
	 }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)refreshLabelValues
{
    __block int countOfContacts = 0;
    __block int countOfFakeContacts = 0;
    [MOABHelper traverseRecords:^(ABAddressBookRef addressbook, ABRecordRef record)
	 {
		 if (record)
		 {
			 CFStringRef firstNameRef = ABRecordCopyValue(record, kABPersonFirstNameProperty);
			 NSString *firstName = (__bridge NSString *)firstNameRef;
			 if ([firstName hasPrefix:@"AT"])
			 {
				 countOfFakeContacts++;
			 }
			 else
			 {
				 countOfContacts++;
			 }
		 }
	 }];
    self.numOfContactsLabel.text = [NSString stringWithFormat:@"%d", countOfContacts];
    self.numOfFakeContactsLabel.text = [NSString stringWithFormat:@"%d", countOfFakeContacts];
	
	self.generateBtn.hidden = countOfFakeContacts > 0;
	self.removeBtn.hidden = countOfFakeContacts == 0;
}

- (IBAction)generate:(id)sender
{
	NSString *text = self.numOfFakeContactsLabel.text;
	if ([text intValue])
	{
		[[[UIAlertView alloc] initWithTitle:nil
								   message:@"Remove all fake contacts first."
								  delegate:nil
						 cancelButtonTitle:nil
						 otherButtonTitles:@"OK", nil] show];
		return;
	}
	
	self.generateBtn.alpha = 0.5;
	self.generateBtn.enabled = NO;
    [self.indicatorView startAnimating];
	
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        ABAddressBookRef addressbook = ABAddressBookCreate();
        CFErrorRef anError = NULL;
		int base = 73000000;
        for (int i = 0; i < 10; i++)
        {
            ABRecordRef record = ABPersonCreate();
			// Set first name
            CFStringRef nameRef = (__bridge CFStringRef)[NSString stringWithFormat:@"AT%d", i];
            bool didSetFirstName = ABRecordSetValue(record, kABPersonFirstNameProperty, nameRef, &anError);
			
			// Set phone number
			NSString *strNumber = nil;
//			if (i < self.phoneNumbers.count)
//			{
//				strNumber = self.phoneNumbers[i];
//			}
//			else
//			{
				strNumber = [NSString stringWithFormat:@"+65%d", base++];
//			}
			
			ABMultiValueRef phoneNumbersRef = ABMultiValueCreateMutable(kABMultiStringPropertyType);
			ABMultiValueAddValueAndLabel(phoneNumbersRef,
										 (__bridge CFStringRef)strNumber,
										 kABPersonPhoneMobileLabel,
										 NULL);
			bool didSetPhoneNumber = ABRecordSetValue(record, kABPersonPhoneProperty, phoneNumbersRef, &anError);
            if (didSetFirstName && didSetPhoneNumber)
            {
                ABAddressBookAddRecord(addressbook, record, &anError);
            }
        }
        ABAddressBookSave(addressbook, &anError);
        CFRelease(addressbook);
		
        dispatch_async(dispatch_get_main_queue(), ^{
            [self refreshLabelValues];
            [self.indicatorView stopAnimating];
			self.generateBtn.enabled = YES;
			self.generateBtn.alpha = 1.0;
        });
    });
}

- (IBAction)remove:(id)sender
{
	self.removeBtn.alpha = 0.5;
	self.removeBtn.enabled = NO;
    [self.indicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __block CFErrorRef anError = NULL;
        [MOABHelper traverseRecords:^(ABAddressBookRef addressbook, ABRecordRef record) {
			if (record)
			{
				CFStringRef firstNameRef = ABRecordCopyValue(record, kABPersonFirstNameProperty);
				NSString *firstName = (__bridge NSString *)firstNameRef;
				if ([firstName hasPrefix:@"AT"])
				{
					ABAddressBookRemoveRecord(addressbook, record, &anError);
				}
			}
		}];
		
        dispatch_async(dispatch_get_main_queue(), ^{
            [self refreshLabelValues];
            [self.indicatorView stopAnimating];
			self.removeBtn.enabled = YES;
			self.removeBtn.alpha = 1.0;
        });
    });
}

@end
