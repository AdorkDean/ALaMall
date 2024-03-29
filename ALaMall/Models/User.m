//
//  User.m
//  ALaMall
//
//  Created by dongW on 15/07/27.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "User.h"

@implementation User

//通过本地的存储信息判断用户是否登录
+ (BOOL)isUserLoginByStorage
{
    NSNumber *user_id = [StorageUtil getUserId];
    NSString *access_token = [StorageUtil getAccessToken];
    if (user_id > 0 && access_token.length > 0) {
        return YES;
    } else {
        return NO;
    }
}


//===== 与服务器交互的方法 =====//

//获取用户信息，每次获取用户信息都要更新Storage的用户信息
+ (void)getUser:(void(^)(BOOL status, NSNumber *code, NSString *message, User *user))success
        failure:(void(^)(NSError *error))failure
{
    NSString *url = kUrlUserGet;
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    //因为setObjectForKey: object cannot be nil，所以这些判断是要的
    //if ([StorageUtil getUserId] != nil)
        //[params setObject:[StorageUtil getUserId] forKey:kStorageUserId];
      //  [params setObject:[StorageUtil getUserId] forKey:@"id"];
    
    if ([StorageUtil getAccessToken] != nil)
        [params setObject:[StorageUtil getAccessToken] forKey:kStorageAccessToken];
    
    [HttpClient requestJson:url
                     params:params
                    success:^(BOOL status, NSNumber *code, NSString *message, NSDictionary *data) {
                        User *user = [User mj_objectWithKeyValues:[data objectForKey:@"user"]];
                        [self saveUserInfoToStorage:user];
                        success(status, code, message, user);
                    }
                    failure:failure];
}

//登录
+ (void)loginWithMobile:(NSString *)mobile
               password:(NSString *)password
                success:(void(^)(NSNumber *code, NSString *message, NSDictionary *data))success
                failure:(void(^)(NSError *error))failure
{
    NSString *url = kUrlUserLogin;
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   mobile,   @"user_name",
                                   password, @"password", nil];
    [HttpClient requestJson:url
                     params:params
                    success:^(BOOL status, NSNumber *code, NSString *message, NSDictionary *data) {
                        success(code, message, data[@"index_response"]);
                    }
                    failure:failure];
}

//保存用户信息到本地
+ (void)saveUserInfoToStorage:(User *)user
{
    [StorageUtil saveUserId:user.id];
    [StorageUtil saveUserLevel:user.level];
    [StorageUtil saveUserLevelLabel:user.level_label];
    [StorageUtil saveUserMobile:user.mobile];
    [StorageUtil saveAccessToken:user.access_token];
}

@end
