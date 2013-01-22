//
//  SPDeepCopy.h
//  ObjcTest
//
//  Created by an hailin on 17/1/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SPDeepCopy)

- (NSArray*) deepCopy;
- (NSMutableArray*) mutableDeepCopy;

@end

@interface NSDictionary (SPDeepCopy)

- (NSDictionary*) deepCopy;
- (NSMutableDictionary*) mutableDeepCopy;

@end
