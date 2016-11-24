//
//  UserModel.m
//  Advertisement
//
//  Created by Kimi.zhang on 2016/11/24.
//  Copyright © 2016年 Kimi.zhang. All rights reserved.
//

#import "UserModel.h"
#import <objc/runtime.h>

#define CURRENT_USER_KEY @"CURRENT_USER_KEY"


@implementation UserModel

+ (void)load{
    UserModel* user = [self getInstance];
    [user initFromUserDefaults];
}

+ (UserModel *)getInstance {
    
    static UserModel *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[UserModel alloc] init];
        
    });
    
    return _sharedClient;
    
}

- (void)initFromUserDefaults{
    NSDictionary* userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:CURRENT_USER_KEY];
    if (userInfo) {
        [userInfo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            if (class_getProperty([self class], [key UTF8String])) {
                // it has that property!
                [self setValue:obj forKey:key];
            }else{
                DDLogDebug(@"ASSERT FAILED IN CURRENT_USER initFromUserDefaults.");
                
            }
            
        }];
    }
}

- (void)loadUserData:(NSDictionary*)dic{
    if (dic == nil) {
        [self cleanUser];
    } else {
        self.pinbanId      = dic[@"pinbanId"];//拼伴账号
        self.memberId      = dic[@"memberId"];//
        self.pbToken       = dic[@"pbToken"];
        
        self.nickName      = dic[@"memberInfo"][@"nickName"];
        self.createTimeReal= dic[@"memberInfo"][@"createTimeReal"];//账号创建时间
        self.avatar        = dic[@"memberInfo"][@"avatar"];
        self.gender        = dic[@"memberInfo"][@"gender"];
        
        self.province      = dic[@"memberInfo"][@"province"];//居住地
        self.city          = dic[@"memberInfo"][@"city"];
        
        self.latitude      = dic[@"memberInfo"][@"latitude"];
        self.longitude     = dic[@"memberInfo"][@"longitude"];
        self.mobile        = dic[@"memberInfo"][@"mobile"];
        self.score         = dic[@"memberInfo"][@"score"];
        self.level         = dic[@"memberInfo"][@"level"];
        self.findByPhone   = dic[@"memberInfo"][@"findByPhone"];
        self.findByPinban  = dic[@"memberInfo"][@"findByPinban"];
        self.scoreToLevel  = dic[@"memberInfo"][@"scoreToLevel"];
        self.extra         = dic[@"memberInfo"][@"scoreToLevel"];
        self.isInvitedDirect= dic[@"memberInfo"][@"isInvitedDirect"];
        
        self.background    = dic[@"memberExtra"][@"background"];
        self.barrage       = dic[@"memberExtra"][@"barrage"];//弹幕
        self.birthday      = dic[@"memberExtra"][@"birthday"];
        self.constellation    = dic[@"memberExtra"][@"constellation"];
        self.hometown    = dic[@"memberExtra"][@"hometown"];
        self.insteresting  = dic[@"memberExtra"][@"insteresting"];
        self.location      = dic[@"memberExtra"][@"location"];//地点
        self.occupation    = dic[@"memberExtra"][@"occupation"];//职业
        self.oftenInfested = dic[@"memberExtra"][@"oftenInfested"];//常出没地
        self.signature     = dic[@"memberExtra"][@"signature"];//个性签名
        self.tags          = dic[@"memberExtra"][@"tags"];//标签
        self.age          = dic[@"memberExtra"][@"age"];
        
        // 将允许手机号搜索 和 拼伴号搜索  存入本地
//        BOOL phoneFinding = [DateFormatterHelper isNilValue:self.findByPhone] ? NO:![self.findByPhone boolValue];
//        BOOL numFinding = [DateFormatterHelper isNilValue:self.findByPinban] ? NO:![self.findByPinban boolValue];
//        
//        [[SettingInfo shareSettingInfo] setSettingValue:phoneFinding forKey:key_Setting_AllowPhoneSearch];
//        [[SettingInfo shareSettingInfo] setSettingValue:numFinding forKey:key_Setting_AllowPinBanNumberSearch];
        
    }
    [self save];
}

- (void)cleanUser{
    unsigned int propertyCount;
    objc_property_t* properties = class_copyPropertyList(self.class, &propertyCount);
    for (unsigned int i = 0; i < propertyCount; i++) {
        objc_property_t oneProperty = properties[i];
        const char *propertyName = property_getName(oneProperty);
        NSString* keyName = [NSString stringWithUTF8String:propertyName];
        [self setValue:nil forKey:keyName];
    }
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:CURRENT_USER_KEY];
    [defaults synchronize];
    
    self.pinbanId      =nil;
    self.memberId      =nil;
    self.pbToken       =nil;
    self.nickName      =nil;
    self.createTimeReal=nil;
    self.avatar        =nil;
    self.gender        =nil;
    self.province      =nil;
    self.city          =nil;
    self.latitude      =nil;
    self.longitude     =nil;
    self.mobile        =nil;
    
    self.background    =nil;
    self.barrage       =nil;
    self.birthday      =nil;
    self.insteresting  =nil;
    self.location      =nil;
    self.occupation    =nil;
    self.oftenInfested =nil;
    self.signature     =nil;
    self.tags          =nil;
    
}

- (void)save{
    unsigned int propertyCount;
    objc_property_t* properties = class_copyPropertyList(self.class, &propertyCount);
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    for (unsigned int i = 0; i < propertyCount; i++) {
        objc_property_t oneProperty = properties[i];
        const char *propertyName = property_getName(oneProperty);
        NSString* keyName = [NSString stringWithUTF8String:propertyName];
        NSString* value = [self valueForKey:keyName];
        if (value) {
            dict[keyName] = value;
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:CURRENT_USER_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




@end
