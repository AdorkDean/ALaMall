//
//  ButtonUtil.m
//  ALaMall
//
//  Created by dongW on 15/8/25.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "ButtonUtil.h"

@implementation ButtonUtil

+ (UIButton *)redButtonWithTitle:(NSString *)title
{
    UIButton *vBtn = [UIButton new];
    [vBtn setTitle:title forState:UIControlStateNormal];
    [vBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [vBtn setBackgroundColor:kColorMainRed];
    vBtn.layer.borderWidth = 1;
    vBtn.layer.borderColor = kColorMainRed.CGColor;
    vBtn.layer.cornerRadius = 4;
    return vBtn;
}

@end
