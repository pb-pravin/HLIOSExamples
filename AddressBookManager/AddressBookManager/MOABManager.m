//
//  MOABManager.m
//  AddressBookManager
//
//  Created by an hailin on 6/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOABManager.h"

@implementation MOABManager

+ (MOABManager *)sharedManager {
	static MOABManager *instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[MOABManager alloc] init];
	});
	return instance;
}

@end

void MOAddressBookExternalChangeCallback (
										  ABAddressBookRef addressBook,
										  CFDictionaryRef info,
										  void *context
										  ) {
	// Traverse the address book to check changes
	// Upload the changes to server.
}