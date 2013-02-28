//
//  MOUserManager.h
//  UserDemo
//
//  Created by an hailin on 26/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "MOUser.h"

@interface MOUserManager : NSObject {
	NSMutableArray *users;
}

@property(nonatomic, retain) NSMutableArray *users;
+ (MOUserManager *)sharedManager;
- (void)loadUsers;
@end
