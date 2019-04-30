//
//  Category.h
//  ALaMall
//
//  Created by dongW on 15/07/27.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "Product.h"

@interface ProductCategory : NSObject

@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *sort;
@property (nonatomic, strong) NSArray *products; //包含Product

+ (void)getCategoriesWithProducts:(void(^)(BOOL result, NSNumber *code, NSString *message, NSArray *categories))success
                          failure:(void(^)(NSError *error))failure;

@end
