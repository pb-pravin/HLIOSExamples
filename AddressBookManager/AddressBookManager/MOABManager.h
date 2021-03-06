//
//  MOABManager.h
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

/***************************************************************************************************************************
 + For IOS prior to 6.0, You always have the right to access address book, however, for IOS 6.0 and later version, App should gain the access right from user first.
 + On Iphone Simulator 6.0, Apps always have the right to access address book, the behaviour is not the same as on real device.
 + App could also be notified of the address book's change even though it does not have the access right.
 + 
 ****************************************************************************************************************************/

/**********************************************************
 typedef CF_ENUM(CFIndex, ABAuthorizationStatus) {
	 kABAuthorizationStatusNotDetermined = 0,
	 kABAuthorizationStatusRestricted,
	 kABAuthorizationStatusDenied,
	 kABAuthorizationStatusAuthorized
 };
 **********************************************************/

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

#define kAddressBookQueue	dispatch_get_main_queue()
//#define kAddressBookQueue	dispatch_get_global_queue(0, 0)

@interface MOABManager : NSObject
+ (MOABManager *)sharedManager;
- (void)requestAccessWithCompletion:(ABAddressBookRequestAccessCompletionHandler)completionHandler;
- (ABAddressBookRef)addressbook;
- (BOOL)addressbookAccessGranted;
@end
