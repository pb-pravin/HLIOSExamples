//
//  MOViewController.m
//  PersistenceDemo
//
//  Created by an hailin on 22/2/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "MOViewController.h"
#import "FourLines.h"

#define kFileName	@"archive"
#define kDataKey	@"data"

@interface MOViewController ()
@property (retain, nonatomic) IBOutlet UITextField *field1;
@property (retain, nonatomic) IBOutlet UITextField *field2;
@property (retain, nonatomic) IBOutlet UITextField *field3;
@property (retain, nonatomic) IBOutlet UITextField *field4;
@end

@implementation MOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSString *filePath = [self dataFilePath];
	if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
		NSMutableData *data = [[NSMutableData alloc]
							   initWithContentsOfFile:filePath];
		NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]
										 initForReadingWithData:data];
		FourLines *fourLines = [unarchiver decodeObjectForKey:kDataKey];
		[unarchiver finishDecoding];
		self.field1.text = fourLines.field1;
		self.field2.text = fourLines.field2;
		self.field3.text = fourLines.field3;
		self.field4.text = fourLines.field4;
		[unarchiver release];
		[data release];
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(applicationWillResignActive:)
												 name:UIApplicationWillResignActiveNotification
											   object:[UIApplication sharedApplication]];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSString *)dataFilePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentDirectory = [paths objectAtIndex:0];
	return [documentDirectory stringByAppendingPathComponent:kFileName];
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
	FourLines *fourLines = [[FourLines alloc] init];
	fourLines.field1 = self.field1.text;
	fourLines.field2 = self.field2.text;
	fourLines.field3 = self.field3.text;
	fourLines.field4 = self.field4.text;
	
	NSMutableData *data = [[NSMutableData alloc] init];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:fourLines forKey:kDataKey];
	[archiver finishEncoding];
	[data writeToFile:[self dataFilePath] atomically:YES];
	[data release];
	[archiver release];
	[fourLines release];
}


@end
