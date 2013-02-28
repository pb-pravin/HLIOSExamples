//
//  HLAppDelegate.m
//  ObjcTest
//
//  Created by an hailin on 29/12/12.
//  Copyright (c) 2012 HailinAn. All rights reserved.
//

#import "HLAppDelegate.h"
#import "ClassB.h"
#import "HLViewController.h"
#import "MOUser.h"
#import "SPDeepCopy.h"


@implementation HLAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[HLViewController alloc] initWithNibName:@"HLViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
     /** Demo how to use load and initialize class methods. */
//    if ([[NSNull null] isKindOfClass:[ClassB class]]) {
//         
//    }
    
    //ClassA *a = [[ClassA alloc] init];
    //ClassB *b = [[ClassB alloc] init];
    //ClassA *a1 = [ClassA alloc];
    //id a2 = [a1 init];
    
    //[a release];
    //[a1 release];
    //[b release];
    //BOOL canJoin = [ClassA conformsToProtocol:@protocol(NSObject)];
    //[a2 release];
    
    //NSArray *array = @[@"hell", @"world"];
    
     /** Demo how to use NSMutableIndexSet. */
//    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"1", @"2", @"3", @"4", @"5"]];
//    
//    NSMutableIndexSet *indexes = [[[NSMutableIndexSet alloc] init] autorelease];
//    for(int i=0; i<array.count; i++){
//        NSString *s = [array objectAtIndex:i];
//        if([s isEqualToString:@"2"]){
//            [indexes addIndex:i];
//        }
//    }
//    [array removeObjectsAtIndexes:indexes];
    
    /** Demo how to use mutable deep copy. */
//    NSMutableDictionary *m1 = [[[NSMutableDictionary alloc] init] autorelease];
//    [self inserting:m1 withFlag:@"an"];
//    
//    NSMutableDictionary *m2 = [[[NSMutableDictionary alloc] init] autorelease];
//    [self inserting:m2 withFlag:@"hai"];
//    
//    NSMutableDictionary *m3 = [[[NSMutableDictionary alloc] init] autorelease];
//    [self inserting:m3 withFlag:@"lin"];
//
//    
//    NSMutableDictionary *wrapDict = [[[NSMutableDictionary alloc] init] autorelease];
//    [wrapDict setObject:m1 forKey:@"hi"];
//    [wrapDict setObject:m2 forKey:@"ho"];
//    [wrapDict setObject:m3 forKey:@"ih"];
//    [self writing:wrapDict];

    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [paths objectAtIndex:0];
//    NSString *fileName = [path stringByAppendingPathComponent:@"demo"];
//    NSMutableDictionary *mutableDict = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
//    if (mutableDict == nil) {
//        mutableDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Hailin", @"name", [NSNumber numberWithInt:1], @"gender", nil];
//        NSData *buffer = [NSKeyedArchiver archivedDataWithRootObject:mutableDict];
//        [buffer writeToFile:fileName atomically:YES];
//    }
    
    /** Demo how to use NSRange struct. 
    NSRange range1 = NSMakeRange(0, 10);
    NSLog(@"%@", NSStringFromRange(range1));
    
    NSRange range2 = NSMakeRange(2, 11);
    NSLog(@"%@", NSStringFromRange(range2));
    
    NSRange range3 = NSIntersectionRange(range1, range2);
    NSLog(@"%@", NSStringFromRange(range3));
    
    NSRange range4 = NSUnionRange(range1, range2);
    NSLog(@"%@", NSStringFromRange(range4));
    
    NSLog(@"max %d", NSMaxRange(range4));
    
    NSLog(@"%d", NSLocationInRange(3, range4));
    NSLog(@"%d", NSEqualRanges(range1, range2));
     */
    
    
//    NSDictionary *dict = [[[NSDictionary alloc] initWithObjectsAndKeys:@"Hailin", @"name", nil] autorelease];
//    MOUser *user = [[MOUser alloc] initWithDictionary:dict];
//    
//    NSLog(@"%@", user);
//    
//    [user release];
    
    /** Demo how to use NSRegularExpression class
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\b(a|b)(c|d)\\b"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSString *str = @"ac ccd bd BA cd";
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:str options:0 range:NSMakeRange(0, str.length)];
    NSLog(@"number of matches: %u", numberOfMatches);
    
    NSRange range1 = [regex rangeOfFirstMatchInString:str options:0 range:NSMakeRange(0, str.length)];
    if (NSEqualRanges(range1, NSMakeRange(NSNotFound, 0))) {
        NSLog(@"There is no match");
    } else {
        NSLog(@"first matching range: %@ substring: %@", NSStringFromRange(range1), [str substringWithRange:range1]);
    }
    
    NSTextCheckingResult *match = [regex firstMatchInString:str
                                                    options:0
                                                      range:NSMakeRange(0, [str length])];
    if (match) {
        NSRange matchRange = [match range];
        NSRange firstHalfRange = [match rangeAtIndex:1];
        NSRange secondHalfRange = [match rangeAtIndex:2];
         NSLog(@"matchRange: %@%@, firstHalfRange: %@%@, secondHalfRange: %@%@", [str substringWithRange:matchRange], NSStringFromRange(matchRange), [str substringWithRange:firstHalfRange], NSStringFromRange(firstHalfRange), [str substringWithRange:secondHalfRange], NSStringFromRange(secondHalfRange));
    }

    
    NSArray *matches = [regex matchesInString:str
                                      options:0
                                        range:NSMakeRange(0, [str length])];
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        NSRange firstHalfRange = [match rangeAtIndex:1];
        NSRange secondHalfRange = [match rangeAtIndex:2];
        NSLog(@"matchRange: %@%@, firstHalfRange: %@%@, secondHalfRange: %@%@", [str substringWithRange:matchRange], NSStringFromRange(matchRange), [str substringWithRange:firstHalfRange], NSStringFromRange(firstHalfRange), [str substringWithRange:secondHalfRange], NSStringFromRange(secondHalfRange));
    }
    // How powerful it is!
    NSLog(@"original string: %@", str);
    NSString *modifiedString = [regex stringByReplacingMatchesInString:str
                                                               options:0
                                                                 range:NSMakeRange(0, [str length])
                                                          withTemplate:@"$2$1"];
    NSLog(@"modified string: %@", modifiedString);
     */
    
    /** Demo string to int converting
    NSLog(@"@\"\".intValue = %d", @"".intValue);
    NSLog(@"@\"012\".intValue = %d", @"012".intValue);
    NSLog(@"@\"a2bcd\".intValue = %d", @"a2bcd".intValue);
    NSLog(@"@\"  12ab34\".intValue = %d", @"  12ab34".intValue);
    
	NSString *original = @"1234567890";
	// Returns a new string containing the characters of the receiver up to, but not including the one at a given index.
	NSString *sub = [original substringToIndex:5];
	NSLog(@"sub: %@", sub);
     */
	
    /** Demo URL path
    NSURL *url = [NSURL URLWithString:@"http://api.mozat.net/account/requestVcode"];
    NSLog(@"url description: %@", url);
    NSLog(@"url path: %@", url.path);
     */
    
    /** Demo the character replacement method of NSMutableString
    NSMutableString *mutableStr = [[[NSMutableString alloc] initWithString:@"01234"] autorelease];
    NSRange range1 = NSMakeRange(1, 1);
    [mutableStr replaceCharactersInRange:range1 withString:@"aaa"];
    NSLog(@"original: 01234  range: %@  changed: %@", NSStringFromRange(range1), mutableStr);
     */
    
    /** Demo the emoji unicode
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"plist"];
    NSDictionary *emojiDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    for (NSString *key in emojiDict.allKeys) {
        //unsigned short value = [[emojiDict objectForKey:key] intValue];
        //unsigned short keyInShort = [key intValue];
        
        //NSData *data = [NSData datawith
        NSLog(@"=====key %@ len: %d value: %@", key, key.length, [emojiDict objectForKey:key]);
        for (int i=0; i<key.length; i++) {
            unichar c = [key characterAtIndex:i];
            NSLog(@"%u", c);
        }
     
        //NSLog(@"key=%@, value=%C", key, value);
    }
    NSString *s = @"中";
    NSLog(@"=====s %@ len: %d", s, s.length);
    for (int i=0; i<s.length; i++) {
        unichar c = [s characterAtIndex:i];
        NSLog(@"%x", c);
    }
    
    NSLog(@"%d", 0xd83cdf71);
     */
    
    /** NSLog format specifiers:
     %@ Object
     %d, %i signed int
     %u unsigned int
     %f float/double
     %x, %X hexadecimal int
     %o octal int
     %zu size_t
     %p pointer
     %e float/double (in scientific notation)
     %g float/double (as %f or %e, depending on value)
     %s C string (bytes) 
     %S C string (unichar) 
     %.s Pascal string (requires two arguments, pass pstr[0] as the first, pstr+1 as the second) 
     %c character 
     %C unichar
     %lld long long 
     %llu unsigned long long 
     %Lf long double
    NSLog(@"%s\t%s\t0x%08x", "hex", "value", 0x1243);
     */
    
	/** Demo the usage of @encode
	 please refer to
	 https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100
	const char *s = @encode(bool);
    NSLog(@"%s", s);
	 */
	
	/** Demo the usage of NSDate
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:(2014-1970)*365*24*60*60];
	NSLog(@"date: %@", date);
	 */
    
    /** Demo the [] accessor for NSDictionary / NSArray
     */
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"United States", @"US", @"China", @"CN", nil];
    for (NSString *key in dict.allKeys) {
        NSLog(@"%@->%@", key, dict[key]);
    }
    
    NSArray *ar = [NSArray arrayWithObjects:@"US", @"CN", @"JP", nil];
    for (int i=0; i<ar.count; i++) {
        NSLog(@"%d : %@", i, ar[i]);
    }
    return YES;
}




- (void)inserting:(NSMutableDictionary *)dict withFlag:(NSString *)flag{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (YES) {
            static int i = 0;
            NSLog(@"inserting at %@ with %d", flag, i);
            [dict setObject:@"0" forKey:[NSNumber numberWithInt:i++]];
        }
    });
}


- (void)writing:(NSMutableDictionary *)dict {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *fileName = [path stringByAppendingPathComponent:@"demo.plist"];
    
    NSDictionary *aDict = [[dict deepCopy] autorelease];
    //NSDictionary *aDict = [dict mutableDeepCopy];
    //NSDictionary *aDict = [[dict mutableCopy] autorelease];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        while (YES) {
            NSLog(@"writing...");
            NSData *buffer = [NSKeyedArchiver archivedDataWithRootObject:aDict];
            [buffer writeToFile:fileName atomically:YES];
            //[aDict writeToFile:fileName atomically:YES];
        }
    });
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
