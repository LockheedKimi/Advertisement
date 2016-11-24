//
//  UserModel.h
//  Advertisement
//
//  Created by Kimi.zhang on 2016/11/24.
//  Copyright © 2016年 Kimi.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject


@property (nonatomic, copy) NSString *pinbanId;
@property (nonatomic, copy) NSString *memberId;
@property (nonatomic, copy) NSString *pbToken;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *createTimeReal;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *scoreToLevel;
@property (nonatomic, copy) NSString *extra;


@property (nonatomic, copy) NSString *background;
@property (nonatomic, copy) NSString *barrage;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *insteresting;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *occupation;
@property (nonatomic, copy) NSString *oftenInfested;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *findByPhone;//通过手机号查找 默认1不能，0 能
@property (nonatomic, copy) NSString *findByPinban;//通过拼伴号查找 默认0能，1 不能
@property (nonatomic, copy) NSString *level;//等级
@property (nonatomic, copy) NSString *score;//积分
@property (nonatomic, copy) NSString *isInvitedDirect;//能不能被邀请到讨论组 1是能  0 是不能  默认不详
@property (nonatomic, copy) NSString *constellation;//星座
@property (nonatomic, copy) NSString *hometown;//家乡

@property (nonatomic, copy) NSString *chatToken;//聊天token

+(UserModel*) getInstance;

-(void)loadUserData:(NSDictionary*)dic;

-(void)cleanUser;

-(void)save;



@end
