//
//  MOABManager.m
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOABManager.h"

static ABAddressBookRef addressbook;
static BOOL addressbookAccessGranted;

@interface MOABManager ()
@end

static void MOAddressBookExternalChangeCallback (
                                                 ABAddressBookRef addressBook,
                                                 CFDictionaryRef info,
                                                 void *context
                                                 ) {
	// Traverse the address book to check changes
	// Upload the changes to server.
    NSLog(@"address book changed");
}

@implementation MOABManager

+ (MOABManager *)sharedManager {
	static MOABManager *instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[MOABManager alloc] init];
	});
	return instance;
}

- (void)requestAccessWithCompletion:(ABAddressBookRequestAccessCompletionHandler)completionHandler {
    dispatch_async(dispatch_get_main_queue(), ^{
        addressbook = ABAddressBookCreate();
        ABAddressBookRegisterExternalChangeCallback(addressbook, MOAddressBookExternalChangeCallback, NULL);
        if (ABAddressBookRequestAccessWithCompletion != NULL) { // we're on iOS 6
            // Check the authorization status.
            if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
                ABAddressBookRequestAccessWithCompletion(addressbook, ^(bool granted, CFErrorRef error) {
                    addressbookAccessGranted = granted;
                    //ABAddressBookRegisterExternalChangeCallback(addressbook, MOAddressBookExternalChangeCallback, NULL);
                    completionHandler(granted, error);
                });
            } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
                // The user has previously given access, add the contact
                addressbookAccessGranted = YES;
                //ABAddressBookRegisterExternalChangeCallback(addressbook, MOAddressBookExternalChangeCallback, NULL);
                completionHandler(YES, NULL);
            } else {
                // The user has previously denied access
                addressbookAccessGranted = NO;
                completionHandler(NO, NULL);
            }
        } else { // we're on iOS 5 or older
            addressbookAccessGranted = YES;
            //ABAddressBookRegisterExternalChangeCallback(addressbook, MOAddressBookExternalChangeCallback, NULL);
            completionHandler(YES, NULL);
        }
    });
}

- (ABAddressBookRef)addressbook {
    if (addressbookAccessGranted) {
        return addressbook;
    } else {
        return NULL;
    }
}

- (BOOL)addressbookAccessGranted {
    return addressbookAccessGranted;
}

@end
