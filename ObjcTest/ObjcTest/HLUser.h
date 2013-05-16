//
//  HLUser.h
//  ObjcTest
//
//  Created by an hailin on 10/5/13.
//  Copyright (c) 2013 HailinAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLUser : NSObject
@property (nonatomic, assign) uint64_t localId;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSData *data;
@end
