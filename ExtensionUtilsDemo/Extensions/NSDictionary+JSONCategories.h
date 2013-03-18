//
//  NSDictionary+JSONCategories.h
//  ExtensionUtilsDemo
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONCategories)
+ (NSDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)urlAddress;
+ (NSDictionary *)dictionaryWithContentsOfJSONFile:(NSString *)filePath;
- (NSData *)toJSON;
- (NSString *)prettyDescription;
@end
