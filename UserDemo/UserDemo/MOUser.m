//
//  MOUser.m
//  UserDemo
//
//  Created by an hailin on 26/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOUser.h"

@implementation MOUser
@synthesize userId = userId;
@synthesize name = name;
@synthesize gender = gender;
@synthesize age = age;
@synthesize avatar = avatar;
@synthesize tagline = tagline;
@synthesize location = location;

- (id)initWithUserId:(unsigned long)uid {
	self = [super init];
	if (self) {
		userId = uid;
	}
	return self;
}

- (void)dealloc {
	self.name = nil;
	self.avatar = nil;
	self.tagline = nil;
	self.location = nil;
	[super dealloc];
}

@end
