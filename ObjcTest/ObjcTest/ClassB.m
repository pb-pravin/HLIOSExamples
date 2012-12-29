//
//  ClassB.m
//  ObjcTest
//
//  Created by an hailin on 29/12/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB

+ (void)initialize
{
    NSLog(@"ClassB initialize");
}

+ (void)load
{
    NSLog(@"ClassB load");
}

+ (NSString *)description
{
    return @"ClassB ya";
}

@end
