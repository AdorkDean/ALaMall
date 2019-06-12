//
//  ValidatorUtil.h
//  ALaMall
//
//  Created by dongW on 15/8/22.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>

@interface ValidatorUtil : NSObject

//判断是否正确的手机号码格式
+ (BOOL)isValidMobile:(NSString *)mobile error:(NSError **)error;

//判断是否正确的密码格式
+ (BOOL)isValidPassword:(NSString *)password error:(NSError **)error;

//判断用户名是否有效
+ (BOOL)isValidUser:(NSString*)userName;

@end
