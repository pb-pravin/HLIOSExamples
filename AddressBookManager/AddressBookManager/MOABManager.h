//
//  MOABManager.h
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

void MOAddressBookExternalChangeCallback (
										  ABAddressBookRef addressBook,
										  CFDictionaryRef info,
										  void *context
										  );


@interface MOABManager : NSObject

+ (MOABManager *)sharedManager;


@end
