//
//  User.h
//  ALaMall
//
//  Created by dongW on 15/07/27.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface User : NSObject

@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *username;// 用户名
@property (nonatomic, copy) NSString *email;	// 邮箱
@property (nonatomic, copy) NSString *mobile;	// 手机
@property (nonatomic, copy) NSNumber *level;
@property (nonatomic, copy) NSString *level_label;
@property (nonatomic, copy) NSNumber *created_at;
@property (nonatomic, copy) NSNumber *updated_at;
@property (nonatomic, copy) NSString *access_token;

//通过本地的存储信息判断用户是否登录
+ (BOOL)isUserLoginByStorage;


//===== 与服务器交互的方法 =====//

//获取用户信息，每次获取用户信息都要更新Storage的用户信息
+ (void)getUser:(void(^)(BOOL status, NSNumber *code, NSString *message, User *user))success
    failure:(void(^)(NSError *error))failure;

//登录
+ (void)loginWithMobile:(NSString *)mobile
               password:(NSString *)password
                success:(void(^)(NSNumber *code, NSString *message, NSDictionary *data))success
                failure:(void(^)(NSError *error))failure;

@end
