//
//  Utils.h
//  ALaMall
//
//  Created by dongW on 15/8/16.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface Utils : NSObject

//获取应用程序的Document文件夹路径或文件
+ (NSString *)documentFilePath:(NSString *)filename;

//获取应用程序的Document文件夹
+ (NSURL *)documentDirectory;

//获取应用程序代理
+ (AppDelegate *)appDelegate;

//获取网站内容
+ (NSData *) doGetData:(NSString *)urlStr;
+ (NSString *)doGetString:(NSString *)urlStr;
+ (NSDictionary *)doGetJson:(NSString *)urlStr;

@end
