//
//  NSMutableDictionary+JSONCategories.m
//  ExtensionUtilsDemo
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "NSMutableDictionary+JSONCategories.h"

@implementation NSMutableDictionary (JSONCategories)

+ (NSMutableDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)urlAddress {
	NSData *data = [NSData dataWithContentsOfURL:
					[NSURL URLWithString: urlAddress]];
    __autoreleasing NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
												options:NSJSONReadingMutableContainers error:&error];
    if (error != nil) return nil;
    return result;
}

+ (NSMutableDictionary *)dictionaryWithContentsOfJSONFile:(NSString *)filePath {
	NSData *data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
												options:NSJSONReadingMutableContainers error:&error];
    if (error != nil) return nil;
    return result;
}

@end
