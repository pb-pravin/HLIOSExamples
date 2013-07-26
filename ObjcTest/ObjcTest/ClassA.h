//
//  ClassA.h
//  ObjcTest
//
//  Created by an hailin on 29/12/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassA : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (void)methodInA;
- (void)f;

+ (NSString *)shared;
@end


@interface ClassA (Test)
@property (nonatomic, retain) NSString *height;
@end