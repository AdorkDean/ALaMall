//
//  UIColor+hexColor.h
//  ALaMall
//
//  Created by dongW on 15/8/16.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <UIKit/UIKit.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]

@interface UIColor (hexColor)

//十六进制表示如：#a0a0a0
+ (UIColor *)hexColor:(NSString *)hexStr;

@end
