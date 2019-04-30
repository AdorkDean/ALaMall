//
//  common_macro.h
//  ALaMall
//
//  Created by dongW on 15/8/16.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

//宽高
#define kTopBarHeight       20
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height
#define kNavBarHeight       self.navigationController.navigationBar.frame.size.height
#define kMainHeight         (kScreenHeight - kNavBarHeight - kTopBarHeight)
#define kSelfWidth          self.bounds.size.width
#define kSelfHeight         self.bounds.size.height
#define kSelfViewWidth      self.view.bounds.size.width
#define kSelfViewHeight     self.view.bounds.size.height
#define kWeakSelf(o)        __weak typeof(o) weak_##o = o

//颜色
#define kColorWhite         [UIColor whiteColor]
#define kColorBlue          [UIColor hexColor:@"0000ff"]
#define kColorBlack         [UIColor hexColor:@"000000"]
#define kColorRed           [UIColor hexColor:@"ff0000"]
#define kColorFont          [UIColor hexColor:@"1a1a1a"]
#define kColorBackgound     [UIColor hexColor:@"f8f8f8"]
#define kColorUnderline     [UIColor hexColor:@"d2d2d2"]

//项目的主要色调
#define kColorMainOrange    [UIColor hexColor:@"ff7202"]
#define kColorMainRed       [UIColor hexColor:@"ee0000"]
#define kColorMainBlack     [UIColor hexColor:@"323232"]
#define kColorMainGrey      [UIColor hexColor:@"6a6a6a"]
#define kColorMainBorderGrey [UIColor hexColor:@"a1a1a1"]

//自定义错误提供给NSError使用
#define kCustomErrorDomain @"com.ALaMall.ios"
typedef enum {
    eCustomErrorCodeFailure = 0
} eCustomErrorCode;

