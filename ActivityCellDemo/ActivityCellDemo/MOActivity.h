//
//  MOActivity.h
//  Mozat
//
//  Created by an hailin on 24/1/13.
//  Copyright (c) 2013 MOZAT Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    MOActivityTypeAvatarChanged = 1,
    MOActivityTypeTaglineChanged = 2
};

typedef int MOActivityType;


@interface MOActivity : NSObject

@property (nonatomic, assign) int type;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSDate *datetime;
@property (nonatomic, assign) int userId;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *avatar;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
