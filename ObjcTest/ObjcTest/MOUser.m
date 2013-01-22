//
//  MOUser.m
//  Mozat
//
//  Created by an hailin on 20/12/12.
//  Copyright (c) 2012 MOZAT Pte Ltd. All rights reserved.
//

#import "MOUser.h"

@interface MOUser () {
    NSMutableDictionary *_dictionary;
}

@end
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
/*
NSString* MOGenerateContactUniqueId(NSString* parentAccountUniqueId, NSString* contactId)
{
	return [parentAccountUniqueId stringByAppendingFormat:@"/%@", contactId];
}*/

@implementation MOUser
@synthesize dictionary = _dictionary;
@synthesize isTyping;
@synthesize isOffline;
@synthesize lastseen;
@synthesize isBrandNew;
@synthesize hasActivityInSessionBefore;

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        // for int value, -1 represents unset.
        // for NSObject, nil represents unset.
        _dictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
        //_userType = [_dictionary objectForKey:@"userType"] != nil ? [[_dictionary objectForKey:@"userType"] intValue] : -1;
        _userId = [dictionary objectForKey:@"userId"] != nil ? [[dictionary objectForKey:@"userId"] intValue] : -1;
        _name = [[dictionary objectForKey:@"name"] retain];
        _noteName = [[dictionary objectForKey:@"noteName"] retain];
        _contactName = [[dictionary objectForKey:@"contactName"] retain];
        _gender = [dictionary objectForKey:@"gender"] != nil ? [[dictionary objectForKey:@"gender"] intValue] : -1;
        _avatar = [[dictionary objectForKey:@"avatar"] retain];
        _fullAvatar = [[dictionary objectForKey:@"fullavatar"] retain];
        _countryId = [[dictionary objectForKey:@"countryId"] retain];
        _tagline = [[dictionary objectForKey:@"tagline"] retain];
        _friendship = [dictionary objectForKey:@"friendship"] != nil ? [[dictionary objectForKey:@"friendship"] intValue] : -1;
        _ts = [[dictionary objectForKey:@"ts"] retain];
        _phoneNumber = [[dictionary objectForKey:@"phoneNumber"] retain];
        _rawPhoneNumbers = [[dictionary objectForKey:@"rawPhoneNumbers"] retain];
        _rawPhoneNumber = [[dictionary objectForKey:@"rawPhoneNumber"] retain];
        _photoCount = [dictionary objectForKey:@"photoCount"] != nil ? [[dictionary objectForKey:@"photoCount"] intValue] : -1;
        
        self.isTyping = [dictionary objectForKey:@"isTyping"] != nil ? [[dictionary objectForKey:@"isTyping"] boolValue] : NO;
        self.isOffline = [dictionary objectForKey:@"isOffline"] != nil ? [[dictionary objectForKey:@"isOffline"] boolValue] : NO;
        self.lastseen = [dictionary objectForKey:@"lastSeen"] != nil ? [[dictionary objectForKey:@"lastSeen"] intValue] : 0;
        
        isBrandNew = [dictionary objectForKey:@"isBrandNew"] != nil ? [[dictionary objectForKey:@"isBrandNew"] boolValue] : YES;
        hasActivityInSessionBefore = [dictionary objectForKey:@"hasActivityInSessionBefore"] != nil ? [[dictionary objectForKey:@"hasActivityInSessionBefore"] boolValue] : NO;
    }
    return self;
}

- (NSString *)description
{
    return [_dictionary description];
}


- (void)dealloc {
    [_dictionary release];
    [_name release];
    [_noteName release];
    [_contactName release];
    [_avatar release];
    [_fullAvatar release];
    [_countryId release];
    [_tagline release];
    [_ts release];
    [_phoneNumber release];
    [_rawPhoneNumber release];
    [_rawPhoneNumbers release];
    [super dealloc];
}

//- (void)setUserType:(int)userType {
//    [_dictionary setObject:[NSNumber numberWithInt:userType] forKey:@"userType"];
//    _userType = userType;
//}

// userId is a readonly property

- (void)setName:(NSString *)name
{
    if (_name != name)
    {
        [_name release];
        _name = [name retain];
        if (_name) {
            [_dictionary setObject:name forKey:@"name"];
        }
    }
}

- (void)setNoteName:(NSString *)noteName
{
    if (_noteName != noteName)
    {
        [_noteName release];
        _noteName = [noteName retain];
        if (_noteName) {
            [_dictionary setObject:noteName forKey:@"noteName"];
        }
    }
}

- (void)setContactName:(NSString *)contactName
{
    if (_contactName != contactName)
    {
        [_contactName release];
        _contactName = [contactName retain];
        if (_contactName) {
            [_dictionary setObject:contactName forKey:@"contactName"];
        }
    }
}

- (void)setGender:(int)gender
{
    [_dictionary setObject:[NSNumber numberWithInt:gender] forKey:@"gender"];
    _gender = gender;
}

- (void)setAvatar:(NSString *)avatar
{
    if (_avatar != avatar)
    {
        [_avatar release];
        _avatar = [avatar retain];
        if (_avatar) {
            [_dictionary setObject:avatar forKey:@"avatar"];
        }
    }
}

- (void)setFullAvatar:(NSString *)fullAvatar
{
    if (_fullAvatar != fullAvatar)
    {
        [_fullAvatar release];
        _fullAvatar = [fullAvatar retain];
        if (_fullAvatar) {
            [_dictionary setObject:_fullAvatar forKey:@"fullavatar"];
        }
    }
}

- (void)setPhotoCount:(int)photoCount
{
    [_dictionary setObject:[NSNumber numberWithInt:photoCount] forKey:@"photoCount"];
    _photoCount = photoCount;
}

- (void)setCountryId:(NSString *)countryId
{
    if (_countryId != countryId)
    {
        [_countryId release];
        _countryId = [countryId retain];
        if (_countryId) {
            [_dictionary setObject:countryId forKey:@"countryId"];
        }
    }
}

- (void)setTagline:(NSString *)tagline
{
    if (_tagline != tagline)
    {
        [_tagline release];
        _tagline = [tagline retain];
        if (_tagline) {
            [_dictionary setObject:tagline forKey:@"tagline"];
        }
    }
}

- (void)setFriendship:(int)friendship {
    if (_friendship != friendship) {
        [_dictionary setObject:[NSNumber numberWithInt:friendship] forKey:@"friendship"];
        _friendship = friendship;
    }
}

- (void)setTs:(NSString *)ts {
    if (_ts != ts)
    {
        [_ts release];
        _ts = [ts retain];
        if (_ts) {
            [_dictionary setObject:ts forKey:@"ts"];
        }
    }
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
    if (_phoneNumber != phoneNumber)
    {
        [_phoneNumber release];
        _phoneNumber = [phoneNumber retain];
        if (_phoneNumber) {
            [_dictionary setObject:phoneNumber forKey:@"phoneNumber"];
        }
    }
}

- (void)setRawPhoneNumbers:(NSMutableArray *)rawPhoneNumbers
{
    if (_rawPhoneNumbers != rawPhoneNumbers)
    {
        [_rawPhoneNumbers release];
        _rawPhoneNumbers = [rawPhoneNumbers retain];
        if (_rawPhoneNumbers) {
            [_dictionary setObject:rawPhoneNumbers forKey:@"rawPhoneNumbers"];
        }
    }
}

- (void)setRawPhoneNumber:(NSString *)rawPhoneNumber
{
    if (_rawPhoneNumber != rawPhoneNumber)
    {
        [_rawPhoneNumber release];
        _rawPhoneNumber = [rawPhoneNumber retain];
        if (_rawPhoneNumber) {
            [_dictionary setObject:rawPhoneNumber forKey:@"rawPhoneNumber"];
        }
    }
}

+ (NSString *)genderRepresentationFor:(MOGenderType) genderType
{
    NSString *result;
    
    if (genderType == MOGenderTypeMale)
    {
        result = @"Male";
    }
    else if (genderType == MOGenderTypeFemale)
    {
        result = @"Female";
    }
    else
    {
        result = @"";
    }

    return result;
}

- (NSString *)displayName
{
    if (self.friendship == MOFriendshipTypeNotFriend)
    {
        return self.name;
    }
    else if (self.friendship == MOFriendshipTypePhoneFriend)
    {
        // Need to modify to get name from address book.
        //return (self.noteName != nil) ? self.noteName : self.name;
        if (self.noteName) {
            return self.noteName;
        } else if (self.contactName) {
            return self.contactName;
        } else {
            return self.name;
        }
    }
    else if (self.friendship == MOFriendshipTypeSocialFriend)
    {
        return (self.noteName != nil) ? self.noteName : self.name;
    }
    else if (self.friendship == MOFriendshipTypeSelf)
    {
        return self.name;
    }
    return @"";
}

@end
