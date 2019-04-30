//
//  StringUtil.m
//  ALaMall
//
//  Created by dongW on 15/8/25.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "StringUtil.h"

@implementation StringUtil

+ (NSString *)trim:(NSString *)string
{
    //去除两端空格
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //去除两端空格和回车
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return string;
}

@end
