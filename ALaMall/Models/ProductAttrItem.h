//
//  DbUtil.h
//  ALaMall
//
//  Created by Tony Wong on 15/9/16.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "ProductAttrItemValue.h"

@interface ProductAttrItem : NSObject

@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *print_name;

//商品属性值
@property (nonatomic, copy) NSArray *productAttrItemValues;

@end
