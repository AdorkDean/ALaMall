//
//  DbUtil.h
//  ALaMall
//
//  Created by Tony Wong on 15/9/16.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "ProductAttrItem.h"

@implementation ProductAttrItem

// 实现这个方法：告诉MJExtension框架数组里面装的是什么模型
+ (NSDictionary *)objectClassInArray{
    return @{
             @"productAttrItemValues" : [ProductAttrItemValue class]
             };
}

@end
