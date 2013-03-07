//
//  NSMutableDictionary+SafeSetter.m
//  ExtensionUtilsDemo
//
//  Created by an hailin on 3/5/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "NSMutableDictionary+SafeSetter.h"

@implementation NSMutableDictionary (SafeSetter)
- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    [self setObject:(anObject != nil ? anObject : [NSNull null]) forKey:aKey];
}
@end
