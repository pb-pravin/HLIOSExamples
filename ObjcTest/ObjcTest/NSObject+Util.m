//
//  NSObject+Util.m
//  ObjcTest
//
//  Created by an hailin on 26/7/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import "NSObject+Util.h"
#import <objc/runtime.h>


@implementation NSObject (Util)
+ (NSArray *)propertyList
{
	NSMutableArray *array = [NSMutableArray array];
	unsigned int outCount;
	objc_property_t *properties = class_copyPropertyList(self, &outCount);
	for (int i=0; i<outCount; i++)
	{
		NSParameterAssert(properties);
		const char *name = property_getName(properties[i]);
		[array addObject:[NSString stringWithFormat:@"%s", name]];
		
//		fprintf(stdout, "%s %s\n", property_getName(property),
//				property_getAttributes(property));
	}
	return [NSArray arrayWithArray:array];
}
@end
