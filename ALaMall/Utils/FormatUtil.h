//
//  FormatUtil.h
//  ALaMall
//
//  Created by dongW on 15/8/22.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <Foundation/Foundation.h>

@interface FormatUtil : NSObject

//格式化价格, 总是以人民币显示
+ (NSString *)formatPrice:(NSNumber *)price;
+ (NSString *)formatFloatPrice:(float)price;

@end
