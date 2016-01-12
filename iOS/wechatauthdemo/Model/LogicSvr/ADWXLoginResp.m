//
//  ADWXLoginResp.m
//
//  Created by WeChat  on 14/08/2015
//  Copyright (c) 2015 Tencent. All rights reserved.
//

#import "ADWXLoginResp.h"
#import "ADBaseResp.h"


NSString *const kADWXLoginRespBaseResp = @"base_resp";
NSString *const kADWXLoginRespUin = @"uin";
NSString *const kADWXLoginRespLoginTicket = @"login_ticket";
NSString *const kADWXLoginRespHasBindApp = @"has_bind_app";


@interface ADWXLoginResp ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ADWXLoginResp

@synthesize baseResp = _baseResp;
@synthesize uin = _uin;
@synthesize loginTicket = _loginTicket;
@synthesize hasBindApp = _hasBindApp;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.baseResp = [ADBaseResp modelObjectWithDictionary:[dict objectForKey:kADWXLoginRespBaseResp]];
            self.uin = [[self objectOrNilForKey:kADWXLoginRespUin fromDictionary:dict] doubleValue];
            self.loginTicket = [self objectOrNilForKey:kADWXLoginRespLoginTicket fromDictionary:dict];
            self.hasBindApp = [[self objectOrNilForKey:kADWXLoginRespHasBindApp fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.baseResp dictionaryRepresentation] forKey:kADWXLoginRespBaseResp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uin] forKey:kADWXLoginRespUin];
    [mutableDict setValue:self.loginTicket forKey:kADWXLoginRespLoginTicket];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasBindApp] forKey:kADWXLoginRespHasBindApp];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.baseResp = [aDecoder decodeObjectForKey:kADWXLoginRespBaseResp];
    self.uin = [aDecoder decodeDoubleForKey:kADWXLoginRespUin];
    self.loginTicket = [aDecoder decodeObjectForKey:kADWXLoginRespLoginTicket];
    self.hasBindApp = [aDecoder decodeBoolForKey:kADWXLoginRespHasBindApp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_baseResp forKey:kADWXLoginRespBaseResp];
    [aCoder encodeDouble:_uin forKey:kADWXLoginRespUin];
    [aCoder encodeObject:_loginTicket forKey:kADWXLoginRespLoginTicket];
    [aCoder encodeBool:_hasBindApp forKey:kADWXLoginRespHasBindApp];
}

- (id)copyWithZone:(NSZone *)zone
{
    ADWXLoginResp *copy = [[ADWXLoginResp alloc] init];
    
    if (copy) {

        copy.baseResp = [self.baseResp copyWithZone:zone];
        copy.uin = self.uin;
        copy.loginTicket = [self.loginTicket copyWithZone:zone];
        copy.hasBindApp = self.hasBindApp;
    }
    
    return copy;
}


@end
