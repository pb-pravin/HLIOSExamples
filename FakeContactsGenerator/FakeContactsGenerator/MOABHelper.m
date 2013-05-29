//
//  MOABManager.m
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOABHelper.h"

static BOOL addressbookAccessGranted;

@interface MOABHelper ()
@end

@implementation MOABHelper

+ (void)requestAccessWithCompletion:(ABAddressBookRequestAccessCompletionHandler)completionHandler
{
    ABAddressBookRef addressbook = ABAddressBookCreate();
    if (ABAddressBookRequestAccessWithCompletion != NULL)       // we're on iOS 6
    { // Check the authorization status.
        if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined)
        {
            ABAddressBookRequestAccessWithCompletion(addressbook /*[self getAddressbook]*/,
                                                     ^(bool granted, CFErrorRef error) {
														 addressbookAccessGranted = granted;
														 completionHandler(granted, error);
													 });
        }
        else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized)
        {
			// The user has previously given access, add the contact
            addressbookAccessGranted = YES;
            completionHandler(YES, NULL);
        }
        else
        {
			// The user has previously denied access
            addressbookAccessGranted = NO;
            completionHandler(NO, NULL);
        }
    }
    else         // we're on iOS 5 or older
    {
        addressbookAccessGranted = YES;
        completionHandler(YES, NULL);
    }
    CFRelease(addressbook);
}

+ (BOOL)addressbookAccessGranted
{
    return addressbookAccessGranted;
}

+ (void)traverseRecords:(void (^)(ABAddressBookRef addressbook, ABRecordRef record))handler
{
    ABAddressBookRef addressbook = ABAddressBookCreate();    //[self getAddressbook];
    NSArray *people = CFBridgingRelease(
										ABAddressBookCopyArrayOfAllPeople(addressbook));
    for (int i = 0; i < people.count; i++)
    {
        ABRecordRef record = (__bridge ABRecordRef)[people objectAtIndex:i];
        handler(addressbook, record);
    }
	CFErrorRef anError = NULL;
	ABAddressBookSave(addressbook, &anError);
    CFRelease(addressbook);
}

@end
