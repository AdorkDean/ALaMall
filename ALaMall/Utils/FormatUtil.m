//
//  FormatUtil.m
//  ALaMall
//
//  Created by dongW on 15/8/22.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "FormatUtil.h"

@implementation FormatUtil

+ (NSString *)formatPrice:(NSNumber *)price {
    float floatPrice = [price floatValue];
    NSString *priceStr = [self formatFloatPrice:floatPrice];
    return priceStr;
}

+ (NSString *)formatFloatPrice:(float)price {
    NSString *priceStr = [NSString stringWithFormat:@"￥%.2f", price];
    
    /*
     NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
     formatter.numberStyle = NSNumberFormatterD
     NSString *priceStr = [formatter stringFromNumber:[NSNumber numberWithFloat:price]];
     */
    
    return priceStr;
}

@end
