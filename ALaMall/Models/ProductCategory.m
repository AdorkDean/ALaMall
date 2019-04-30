//
//  ProductCategory.m
//  ALaMall
//
//  Created by dongW on 15/07/27.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "ProductCategory.h"

@implementation ProductCategory

// 实现这个方法：告诉MJExtension框架products数组里面装的是什么模型
+ (NSDictionary *)objectClassInArray{
    return @{
                @"products" : [Product class]
            };
}

+ (void)getCategoriesWithProducts:(void(^)(BOOL result, NSNumber *code, NSString *message, NSArray *categories))success
                          failure:(void(^)(NSError *error))failure
{
    NSString *url = kUrlCategoryListWithProduct;
    [HttpClient requestJson:url
               params:nil
              success:^(BOOL status, NSNumber *code, NSString *message, NSDictionary *data){
                  NSMutableArray *categories = [ProductCategory mj_objectArrayWithKeyValuesArray:[data objectForKey:@"categories"]];
                  success(status, code, message, categories);
              }
              failure:failure];
}

@end
