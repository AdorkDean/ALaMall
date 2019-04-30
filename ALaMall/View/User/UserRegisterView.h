//
//  UserRegisterView.h
//  ALaMall
//
//  Created by 董伟 on 2019/4/20.
//  Copyright © 2019 ZBJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserRegisterViewDelegate <NSObject>

- (void)doClickRegisterBtnWithMobile:(NSString *)mobile password:(NSString *)password;

- (void)doClickVerificationBtn;

@end

@interface UserRegisterView : UIView

#pragma mark - VarProperty -- 变量属性声明
@property (nonatomic, weak) id<UserRegisterViewDelegate> delegate;

#pragma mark - ViewProperty -- 视图属性声明


#pragma mark - Function -- 方法声明


@end
