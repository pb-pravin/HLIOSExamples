//
//  FourLines.h
//  PersistenceDemo
//
//  Created by an hailin on 22/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kField1Key	@"field1"
#define kField2Key	@"field2"
#define kField3Key	@"field3"
#define kField4Key	@"field4"

@interface FourLines : NSObject <NSCoding, NSCopying>
{
	NSString *field1;
	NSString *field2;
	NSString *field3;
	NSString *field4;
}

@property (retain, nonatomic) NSString *field1;
@property (retain, nonatomic) NSString *field2;
@property (retain, nonatomic) NSString *field3;
@property (retain, nonatomic) NSString *field4;

@end
