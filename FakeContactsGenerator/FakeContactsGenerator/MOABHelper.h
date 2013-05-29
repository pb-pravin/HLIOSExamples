//
//  MOABManager.h
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

/**
 * For IOS prior to 6.0, You always have the right to access address book, however, for IOS 6.0 and
 * later version, App should gain the access right from user first.
 *
 * On Iphone Simulator 6.0, Apps always have the right to access address book, the behaviour is not 
 * the same as on real device. App could also be notified of the address book's change even though 
 * it does not have the access right.
 */

/**
 * The followed code was extracted from Apple's header file. Just F.Y.I.
 *
 * typedef CF_ENUM(CFIndex, ABAuthorizationStatus) {
 * 	 kABAuthorizationStatusNotDetermined = 0,
 * 	 kABAuthorizationStatusRestricted,
 * 	 kABAuthorizationStatusDenied,
 * 	 kABAuthorizationStatusAuthorized
 *  };
 */

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface MOABHelper : NSObject
+ (void)requestAccessWithCompletion:(ABAddressBookRequestAccessCompletionHandler)completionHandler;
+ (BOOL)addressbookAccessGranted;
+ (void)traverseRecords:(void (^)(ABAddressBookRef addressbook, ABRecordRef record))handler;
@end
