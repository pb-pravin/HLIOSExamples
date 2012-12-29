//
//  ClassA.m
//  ObjcTest
//
//  Created by an hailin on 29/12/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA

+ (void)initialize
{
    NSLog(@"ClassA initialize");
}

+ (void)load
{
    NSLog(@"ClassA load");
}

- (void)dealloc
{
    NSLog(@"ClassA dealloc");
    [super dealloc];
}

@end
