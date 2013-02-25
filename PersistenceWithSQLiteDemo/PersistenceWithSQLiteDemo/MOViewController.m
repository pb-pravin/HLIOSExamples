//
//  MOViewController.m
//  PersistenceWithSQLiteDemo
//
//  Created by an hailin on 25/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <sqlite3.h>
#import "MOViewController.h"

#define kFilename @"test"

@interface MOViewController ()
@property (retain, nonatomic) IBOutlet UITextField *field1;
@property (retain, nonatomic) IBOutlet UITextField *field2;
@property (retain, nonatomic) IBOutlet UITextField *field3;
@property (retain, nonatomic) IBOutlet UITextField *field4;
@end

@implementation MOViewController

- (NSString *)dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
														 NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	sqlite3 *db;
	if (sqlite3_open([[self dataFilePath] UTF8String], &db) != SQLITE_OK) {
		sqlite3_close(db);
		NSAssert(-1, @"Failed to open database.");
	}
	
	NSString *create = @"CREATE TABLE IF NOT EXISTS FIELDS (ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
	char *errmsg;
	if (sqlite3_exec(db, [create UTF8String], NULL, NULL, &errmsg) != SQLITE_OK) {
		sqlite3_close(db);
		NSAssert(-1, @"Failed to create table.");
	}
	
	NSString *querry = @"SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW;";
	sqlite3_stmt *stmt;
	if (sqlite3_prepare_v2(db, [querry UTF8String],
						   -1, &stmt, NULL) == SQLITE_OK) {
		while (sqlite3_step(stmt) == SQLITE_ROW) {
			int row = sqlite3_column_int(stmt, 0);
			char *field = (char *)sqlite3_column_text(stmt, 1);
			NSString *key = [NSString stringWithFormat:@"field%d", row];
			UITextField *textField = [self valueForKey:key];
			textField.text = [NSString stringWithUTF8String:field];
		}
		sqlite3_finalize(stmt);
	}
	sqlite3_close(db);
	
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(applicationWillResignActive:)
												 name:UIApplicationWillResignActiveNotification
											   object:app];
    [super viewDidLoad];
}

- (void)applicationWillResignActive:(NSNotification *)notification {
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    for (int i = 1; i <= 4; i++) {
        NSString *fieldName = [[NSString alloc]
                               initWithFormat:@"field%d", i];
        UITextField *field = [self valueForKey:fieldName];
        [fieldName release];
		
        char *errorMsg = NULL;
        char *update = "INSERT OR REPLACE INTO FIELDS (ROW, FIELD_DATA) VALUES (?, ?);";
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, update, -1, &stmt, nil)
			== SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i);
            sqlite3_bind_text(stmt, 2, [field.text UTF8String], -1, NULL);
        }
        if (sqlite3_step(stmt) != SQLITE_DONE)
            NSAssert1(0, @"Error updating table: %s", errorMsg);
        sqlite3_finalize(stmt);
		
    }
    sqlite3_close(database);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
