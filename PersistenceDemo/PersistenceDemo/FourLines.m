//
//  FourLines.m
//  PersistenceDemo
//
//  Created by an hailin on 22/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "FourLines.h"

@implementation FourLines
@synthesize field1;
@synthesize field2;
@synthesize field3;
@synthesize field4;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:field1 forKey:kField1Key];
	[aCoder encodeObject:field2 forKey:kField2Key];
	[aCoder encodeObject:field3 forKey:kField3Key];
	[aCoder encodeObject:field4 forKey:kField4Key];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	if (self) {
		field1 = [[aDecoder decodeObjectForKey:kField1Key] retain];
		field2 = [[aDecoder decodeObjectForKey:kField2Key] retain];
		field3 = [[aDecoder decodeObjectForKey:kField3Key] retain];
		field4 = [[aDecoder decodeObjectForKey:kField4Key] retain];
	}
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	FourLines *copy = [[[self class] allocWithZone:zone] init];
	copy.field1 = [[self.field1 copyWithZone:zone] autorelease];
	copy.field2 = [[self.field2 copyWithZone:zone] autorelease];
	copy.field3 = [[self.field3 copyWithZone:zone] autorelease];
	copy.field4 = [[self.field4 copyWithZone:zone] autorelease];
	return copy;
}

@end
