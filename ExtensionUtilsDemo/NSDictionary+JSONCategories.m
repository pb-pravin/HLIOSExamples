//
//  NSDictionary+JSONCategories.m
//  ExtensionUtilsDemo
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import "NSDictionary+JSONCategories.h"

@implementation NSDictionary (JSONCategories)

+ (NSDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)urlAddress
{
    NSData *data = [NSData dataWithContentsOfURL:
					[NSURL URLWithString: urlAddress]];
    __autoreleasing NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
												options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

+ (NSDictionary *)dictionaryWithContentsOfJSONFile:(NSString *)filePath {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
												options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

- (NSData *)toJSON
{
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self
												options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end
