//
//  PriceLabel.h
//  ALaMall
//
//  Created by dongW on 15/8/22.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <UIKit/UIKit.h>

@interface PriceLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame price:(NSNumber *)price;

- (instancetype)initWithFrame:(CGRect)frame curPrice:(NSNumber *)curPrice;

- (instancetype)initWithFrame:(CGRect)frame oriPrice:(NSNumber *)oriPrice;

- (instancetype)initWithCurPrice:(NSNumber *)curPrice;

- (instancetype)initWithOriPrice:(NSNumber *)oriPrice;

- (void)setCurPrice:(NSNumber *)curPrice;

- (void)setOriPrice:(NSNumber *)oriPrice;

- (void)setReducePrice:(NSNumber *)reducePrice;

@end
