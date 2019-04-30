//
//  ProductForm.m
//  ALaMall
//
//  Created by dongW on 15/06/29.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "ProductForm.h"
#import "ProductAttr.h"
#import "ProductAttrItem.h"
#import "ProductAttrItemValue.h"

@implementation ProductForm

- (instancetype)initWithProduct:(Product *)product
{
    self = [super init];
    if (self) {
        self.product_id = product.id;
        self.count = [NSNumber numberWithInteger:1];
        NSMutableArray *attrIdsTemp = [[NSMutableArray alloc] init];
        for (ProductAttr *attr in product.productAttrs) {
            ProductAttrItem *item = attr.productAttrItem;
            if (item.productAttrItemValues.count > 0) {
                ProductAttrItemValue *value = item.productAttrItemValues[0];
                NSMutableDictionary *attrId = [[NSMutableDictionary alloc] init];
                [attrId setValue:item.id forKey:@"itemId"];
                [attrId setValue:value.id forKey:@"valueId"];
                [attrIdsTemp addObject:attrId];
            }
        }
        self.attrIds = [attrIdsTemp copy];
    }
    return self;
}

- (NSDictionary *)fieldsToDictionary
{
    NSMutableArray *attributes = [NSMutableArray new];
    for (NSDictionary *attrId in self.attrIds) {
        NSString *attrIdStr = [NSString stringWithFormat:@"%@_%@", [attrId objectForKey:@"itemId"], [attrId objectForKey:@"valueId"]];
        [attributes addObject:attrIdStr];
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                            self.product_id,     @"product_id",
                            self.count,         @"count",
                            attributes,         @"attributes", nil];
    return params;
}

- (void)submit:(void(^)(BOOL status, NSNumber *code, NSString *message, NSDictionary *data))success
                          failure:(void(^)(NSError *error))failure
{
    NSString *url = kUrlCartAdd;
    NSMutableDictionary *params = [[self fieldsToDictionary] mutableCopy];
    [params setValue:[self attrIdsToString] forKey:@"attributes"];
    
    [HttpClient requestJson:url
                     params:params
                    success:success
                    failure:failure];
}

//把属性转变为字符串如["3_15","2_10",...]
- (NSString *)attrIdsToString
{
    NSString *str = nil;
    NSMutableString *mutStr = [NSMutableString new];
    for (NSDictionary *dict in self.attrIds) {
        NSString *itemId = [dict objectForKey:@"itemId"];
        NSString *valueId = [dict objectForKey:@"valueId"];
        NSString *idStr = [NSString stringWithFormat:@",%@_%@", itemId, valueId];
        [mutStr appendString:idStr];
    }
    if (mutStr.length > 1) {
        str = [mutStr substringFromIndex:1];
    }
    return str;
}

@end
