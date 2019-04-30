//
//  DbUtil.h
//  ALaMall
//
//  Created by dongW on 15/9/16.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "ProductAttrItem.h"

@interface ProductAttr : NSObject

@property (nonatomic, assign) NSInteger product_id;
@property (nonatomic, assign) NSInteger $item_id;
@property (nonatomic, assign) NSInteger $status;

//商品属性项
@property (nonatomic, strong) ProductAttrItem *productAttrItem;

@end
