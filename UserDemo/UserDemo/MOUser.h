//
//  MOUser.h
//  UserDemo
//
//  Created by an hailin on 26/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOUser : NSObject {
	unsigned long userId;
	NSString *name;
	int gender;
	unsigned int age;
	NSString *avatar;
	NSString *tagline;
	NSString *location;
}
@property(nonatomic,readonly) unsigned long userId;
@property(nonatomic,retain) NSString *name;
@property(nonatomic,assign) int gender;
@property(nonatomic,assign) unsigned int age;
@property(nonatomic,retain) NSString *avatar;
@property(nonatomic,retain) NSString *tagline;
@property(nonatomic,retain) NSString *location;

- (id)initWithUserId:(unsigned long)uid;

@end
