//
//  NSMutableDictionary+JSONCategories.h
//  ExtensionUtilsDemo
//
//  Created by an hailin on 1/3/13.
//  Copyright (c) 2013 mozat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JSONCategories)
+ (NSMutableDictionary *)dictionaryWithContentsOfJSONURLString:(NSString *)urlAddress;
+ (NSMutableDictionary *)dictionaryWithContentsOfJSONFile:(NSString *)filePath;
@end
