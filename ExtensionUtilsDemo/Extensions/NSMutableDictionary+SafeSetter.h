//
//  NSMutableDictionary+SafeSetter.h
//  ExtensionUtilsDemo
//
//  Created by an hailin on 3/5/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (SafeSetter)
- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
@end
