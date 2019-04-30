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

@interface ProductAttrItemValue : NSObject

@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *print_name;
@property (nonatomic, copy) NSNumber *price;
@property (nonatomic, copy) NSNumber *is_standard;

@end
