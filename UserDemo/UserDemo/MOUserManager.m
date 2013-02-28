//
//  MOUserManager.m
//  UserDemo
//
//  Created by an hailin on 26/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOUserManager.h"

#define kDataBasePath @"user.sqlite"

@implementation MOUserManager
@synthesize users = users;

- (void)dealloc {
	self.users = nil;
	[super dealloc];
}

+ (MOUserManager *)sharedManager {
	static MOUserManager *instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [MOUserManager new];
		instance.users = [NSMutableArray array];
	});
	return instance;
}

- (NSString *)dataPath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(
														 NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentDirectory = paths[0];
	return [documentDirectory stringByAppendingPathComponent:kDataBasePath];
}

- (void)loadUsers {
	sqlite3 *database;
	if (sqlite3_open([[self dataPath] UTF8String], &database)
		!= SQLITE_OK) {
		sqlite3_close(database);
		NSAssert(-1, @"Failed to open database.");
	}
	NSString *createSQL = @"CREATE TABLE IF NOT EXISTS USERS (USERID INTEGER PRIMARY KEY, NAME TEXT, GENDER INTEGER, AGE INTEGER, AVATAR TEXT, TAGLINE TEXT, LOCATION TEXT);";
	char *errMsg;
	if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errMsg)
		!= SQLITE_OK) {
		sqlite3_close(database);
		NSAssert(-1, @"Error in creating table USERS: %s", errMsg);
	}
	sqlite3_stmt *stmt;
	NSString *querrySQL = @"SELECT USERID, NAME, GENDER, AGE, AVATAR, TAGLINE, LOCATION FROM USERS ORDER BY NAME;";
	if (sqlite3_prepare_v2(database, [querrySQL UTF8String], -1, &stmt, NULL)
		== SQLITE_OK) {
		while (sqlite3_step(stmt) == SQLITE_ROW) {
			unsigned long uid = sqlite3_column_int(stmt, 0);
			MOUser *user = [[MOUser alloc] initWithUserId:uid];
			char *name = (char *)sqlite3_column_text(stmt, 1);
			user.name = [NSString stringWithUTF8String:name];
			int gender = sqlite3_column_int(stmt, 2);
			user.gender = gender;
			unsigned int age = sqlite3_column_int(stmt, 3);
			user.age = age;
			char *avatar = (char *)sqlite3_column_text(stmt, 4);
			user.avatar = [NSString stringWithUTF8String:avatar];
			char *tagline = (char *)sqlite3_column_text(stmt, 5);
			user.tagline = [NSString stringWithUTF8String:tagline];
			char *loc = (char *)sqlite3_column_text(stmt, 6);
			user.location = [NSString stringWithUTF8String:loc];
			[self.users addObject:user];
			[user release];
		}
	}
	sqlite3_finalize(stmt);
	sqlite3_close(database);
	
	if (self.users.count == 0) {
		NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"users"
															 ofType:@"json"];
		NSData *data = [[NSData alloc] initWithContentsOfFile:dataPath];
		NSError *error;
		NSArray *usrs = [NSJSONSerialization JSONObjectWithData:data
														 options:kNilOptions
														   error:&error];
		NSLog(@"users: %@", usrs);
		for (NSDictionary *dict in usrs) {
			unsigned long uid = [dict[@"userId"] intValue];
			MOUser *user = [[MOUser alloc] initWithUserId:uid];
			user.name = dict[@"name"];
			user.gender = [dict[@"gender"] intValue];
			user.age = [dict[@"age"] intValue];
			user.avatar = dict[@"avatar"];
			user.tagline = dict[@"tagline"];
			user.location = dict[@"location"];
			[self.users addObject:user];
			[user release];
		}
	}
}


@end
