//
//  MOUser.h
//  Mozat
//
//  Created by an hailin on 20/12/12.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MOGenderTypeUnset = 0,
    MOGenderTypeMale  = 1,
    MOGenderTypeFemale = 2
} MOGenderType;

typedef enum {
    MOFriendshipTypeUnknown = -1,
    MOFriendshipTypeNotFriend  = 0,
    MOFriendshipTypePhoneFriend = 1,
    MOFriendshipTypeSocialFriend = 2,
    MOFriendshipTypeSelf = 3
} MOFriendshipType;

/**{
 "userId": <int>,
 "name": <string>,
 "gender": <int>,
 "avatar": <string>,
 "countryId": <string>,
 "tagline": <string>,
 "friendship": <int definition see convensions>,
 "ts": <string: timestamp of last modifying this profile>
 }
 */
@interface MOUser : NSObject {
    NSString *_parentAccountUniqueId;
    NSString *_uniqueId;
}

@property (retain, nonatomic) NSMutableDictionary *dictionary;

/** only used in client side, not server side
 {
    -1 unset
    0 phone friend
    1 social friend
 }
 */
//@property (assign, nonatomic) int userType;
@property (readonly, nonatomic) int userId;
@property (retain, nonatomic) NSString *name;
/** note name of the user, only use on client side.
 When display a user name, obey the following priority
 note name > contact name > profile name
 */
@property (retain, nonatomic) NSString *noteName;
@property (retain, nonatomic) NSString *contactName;
@property (readonly, nonatomic) NSString *displayName;
/**
 unknow	0	gender is unset
 male	1
 female	2
 */
@property (assign, nonatomic) int gender;
@property (retain, nonatomic) NSString *avatar;
@property (retain, nonatomic) NSString *fullAvatar;

/** "countryId": "KR", refer to http://countrycode.org
 */
@property (retain, nonatomic) NSString *countryId;
@property (retain, nonatomic) NSString *tagline;
/**
 0	he is not friend
 1	he is your phone friend
 2	he is your social friend
 3	yourself
 */
@property (assign, nonatomic) int friendship;
/**
 timestamp of last modifying this profile
 */
@property (retain, nonatomic) NSString *ts;

//"phoneNumber": <string: phone number with country>,
@property (retain, nonatomic) NSString *phoneNumber;

//"rawPhoneNumbers": <string: raw phone number that client has>
@property (retain, nonatomic) NSMutableArray *rawPhoneNumbers;

//"rawPhoneNumber": <string: raw phone number that client has>
@property (retain, nonatomic) NSString *rawPhoneNumber;

@property (assign, nonatomic) int photoCount;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (retain, nonatomic, readonly)NSString *uniqueId;

@property (nonatomic, readwrite) BOOL isTyping;
@property (nonatomic, readwrite) BOOL isOffline;
@property (nonatomic, readwrite) int lastseen;

// for showing of newly joined friend
@property (nonatomic, readonly) BOOL isBrandNew;
@property (nonatomic, readonly) BOOL hasActivityInSessionBefore;

/** Return the gender's string representation for the given gender type. e.g.
 unknow	0	gender is unset => @""
 male	1                   => @"Male"
 female	2                   => @"Female"
 */
+ (NSString *)genderRepresentationFor:(MOGenderType) genderType;

//- (void)setNoLongerBrandNewForFriend:(int)uid;
//- (void)setHasActivityInSessionBeforeForFriend:(int)uid;

@end
