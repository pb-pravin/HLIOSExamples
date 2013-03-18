//
//  ClassA.m
//  ObjcTest
//
//  Created by an hailin on 29/12/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA

/**
 Initializes the receiver before it’s used (before it receives its first message).

 The runtime sends initialize to each class in a program exactly one time just before the class, or any class that inherits from it, is sent its first message from within the program. (Thus the method may never be invoked if the class is not used.) The runtime sends the initialize message to classes in a thread-safe manner. Superclasses receive this message before their subclasses.
 */
+ (void)initialize
{
    NSLog(@"ClassA initialize");
}
/**
 Invoked whenever a class or category is added to the Objective-C runtime; implement this method to perform class-specific behavior upon loading.
 
 */
+ (void)load
{
    NSLog(@"ClassA load");
}

- (void)dealloc
{
    NSLog(@"ClassA dealloc");
    [super dealloc];
}

- (void)methodInA {

}

- (void)f {
	NSLog(@"A:f");
}

@end
