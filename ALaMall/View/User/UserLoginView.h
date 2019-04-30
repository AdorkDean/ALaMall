//
//  UserLoginView.h
//  ALaMall
//
//  Created by dongW on 19/04/15.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import <UIKit/UIKit.h>

@protocol UserLoginViewDelegate <NSObject>

- (void)doClickLoginBtnWithMobile:(NSString *)mobile password:(NSString *)password;

- (void)doClickForgetBtn;

- (void)doClickRegisterBtn;

- (void)doClickQQBtn;

- (void)doClickWechatBtn;

- (void)doClickSinaBtn;

@end


@interface UserLoginView : UIView

@property (nonatomic, weak) id<UserLoginViewDelegate> delegate;

@end
