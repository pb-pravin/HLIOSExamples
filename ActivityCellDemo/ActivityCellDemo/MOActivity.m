//
//  MOActivity.m
//  Mozat
//
//  Created by an hailin on 24/1/13.
//  Copyright (c) 2013 MOZAT Pte Ltd. All rights reserved.
//

#import "MOActivity.h"

@implementation MOActivity

/** specification for properties of activity object
 "type": <int: 1=avatar, 2=tagline>,
 "content": <string: new value, refer to following definition>,
 "time": <string: occurring time, Unix timestamp>,
 "userId": <int: friend's userId>,
 "name": <string: friend's name>,
 "avatar": <string: friend's avatar>
 */

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        if (dictionary == nil) {
            return nil;
        }
        NSNumber *numType = [dictionary objectForKey:@"type"];
        if (numType == nil) {
            return nil;
        }
        if (numType.intValue!=MOActivityTypeAvatarChanged && numType.intValue!=MOActivityTypeTaglineChanged) {
            return nil;
        }
        self.type = numType.intValue;
        NSString *content = [dictionary objectForKey:@"content"];
        if (content == nil) {
            return nil;
        }
        self.content = content;
        NSString *time = [dictionary objectForKey:@"time"];
        if (time == nil || time.intValue == 0) {
            return nil;
        }
        self.datetime = [NSDate dateWithTimeIntervalSince1970:time.intValue];
        NSNumber *numUserId = [dictionary objectForKey:@"userId"];
        if (numUserId == nil || numUserId.intValue == 0) {
            return nil;
        }
        self.userId = numUserId.intValue;
        NSString *userName = [dictionary objectForKey:@"name"];
        if (userName == nil) {
            return nil;
        }
        self.userName = userName;
        NSString *avatar = [dictionary objectForKey:@"avatar"];
        if (avatar == nil || avatar.length == 0) {
            return nil;
        }
        self.avatar = avatar;
    }
    return self;
}

- (void)dealloc {
    self.content = nil;
    self.datetime = nil;
    self.userName = nil;
    self.avatar = nil;
    [super dealloc];
}

@end
