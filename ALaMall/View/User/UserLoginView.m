//
//  UserLoginView.m
//  ALaMall
//
//  Created by dongW on 19/04/15.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "UserLoginView.h"

@interface UserLoginView ()<UITextFieldDelegate>
{
    UIImageView *_bgImageView;
    UIView *_contentView;
    UIImageView *_logoImageView;
    
    //grid1
    UIImageView *_vMobileIcon;
    UITextField *_vMobileText;
    UILabel *_vGrid1Underline;
    
    //grid2
    UIImageView *_vPasswordIcon;
    UITextField *_vPasswordText;
    UILabel *_vGrid2Underline;
    
    //grid3
    UIButton *_vLoginBtn;
    UIButton *_vForgetBtn;
    UIButton *_vRegisterBtn;
    
    UIButton *_QQBtn;
    UIButton *_wechatBtn;
    UIButton *_sinaBtn;
}

@end

@implementation UserLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    self.backgroundColor = kColorWhite;
    
    _bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginBg"]];
    [self addSubview:_bgImageView];
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    
    _contentView = [UIView new];
    _contentView.backgroundColor = kColorWhite;
    _contentView.layer.cornerRadius = 15.f;
    [self addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(41.f);
        make.right.mas_equalTo(-41.f);
        make.top.mas_equalTo(136.f);
        make.height.mas_equalTo(kScreenHeight - 136.f);
    }];
    
    _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginLogo"]];
    [_contentView addSubview:_logoImageView];
    [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(38.f);
        make.centerX.mas_equalTo(0);
    }];
    
    //划分为三个grid
    UIView *vGrid1 = [UIView new];
    UIView *vGrid2 = [UIView new];
    
    [_contentView addSubview:vGrid1];
    [_contentView addSubview:vGrid2];
    
    kWeakSelf(_logoImageView);

    [vGrid1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(27.f);
        make.right.mas_equalTo(-27);
        make.top.mas_equalTo(weak__logoImageView.mas_bottom).mas_offset(23.f);
        make.height.mas_equalTo(57);
    }];
    [vGrid2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vGrid1);
        make.right.equalTo(vGrid1);
        make.top.equalTo(vGrid1.mas_bottom);
        make.height.mas_equalTo(vGrid1);
    }];
    
    //_vMobileIcon
    _vMobileIcon = [UIImageView new];
    _vMobileIcon.image = [UIImage imageNamed:@"icon_person"];
    [vGrid1 addSubview:_vMobileIcon];
    [_vMobileIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-14.f);
        make.centerY.equalTo(vGrid1);
    }];
    
    //_vMobileText
    _vMobileText = [UITextField new];
    _vMobileText.placeholder = @"用户名/邮箱/手机";
    _vMobileText.delegate = self;
    [vGrid1 addSubview:_vMobileText];
    [_vMobileText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.centerY.equalTo(vGrid1);
        make.right.mas_equalTo(-35.f);
    }];
    
    //_vGrid1Underline
    _vGrid1Underline = [UILabel new];
    _vGrid1Underline.backgroundColor = [UIColor hexColor:@"e1e1e1"];
    [vGrid1 addSubview:_vGrid1Underline];
    [_vGrid1Underline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vGrid1);
        make.right.equalTo(vGrid1);
        make.top.equalTo(vGrid1.mas_baseline);
        make.height.mas_equalTo(1);
    }];
    
    //_vPasswordIcon
    _vPasswordIcon = [UIImageView new];
    _vPasswordIcon.image = [UIImage imageNamed:@"icon_lock"];
    [vGrid2 addSubview:_vPasswordIcon];
    [_vPasswordIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-14);
        make.centerY.mas_equalTo(0);
    }];
    
    //_vPasswordText
    _vPasswordText = [UITextField new];
    _vPasswordText.placeholder = @"输入密码";
    _vPasswordText.delegate = self;
    _vPasswordText.secureTextEntry = YES;
    _vPasswordText.keyboardType = UIKeyboardTypeASCIICapable;
    [vGrid2 addSubview:_vPasswordText];
    [_vPasswordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.centerY.mas_equalTo(vGrid2);
        make.right.mas_equalTo(-35);
    }];
    
    //_vGrid2Underline
    _vGrid2Underline = [UILabel new];
    _vGrid2Underline.backgroundColor = [UIColor hexColor:@"e1e1e1"];
    [vGrid2 addSubview:_vGrid2Underline];
    [_vGrid2Underline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vGrid2);
        make.right.equalTo(vGrid2);
        make.top.equalTo(vGrid2.mas_baseline);
        make.height.mas_equalTo(1);
    }];
    
    //_vForgetBtn
    
    _vForgetBtn = [UIButton new];
    [_vForgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_vForgetBtn setTitleColor:kColorMainOrange forState:UIControlStateNormal];
    _vForgetBtn.titleLabel.font = [UIFont systemFontOfSize:9];
    [_contentView addSubview:_vForgetBtn];
    [_vForgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(vGrid2);
        make.top.equalTo(vGrid2.mas_bottom).with.offset(5);
        make.height.mas_equalTo(10);
    }];
    
    //_vLoginBtn
    _vLoginBtn = [UIButton new];
    [_vLoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_vLoginBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [_vLoginBtn setBackgroundColor:kColorMainOrange];
    _vLoginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _vLoginBtn.layer.cornerRadius = 20.f;
    [_contentView addSubview:_vLoginBtn];
    [_vLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240.f);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(40.f);
        make.top.mas_equalTo(vGrid2.mas_bottom).mas_offset(45.f);
    }];
    
    
    //_vRegisterBtn
    _vRegisterBtn = [UIButton new];
    [_vRegisterBtn setTitle:@"没有账号，立即注册" forState:UIControlStateNormal];
    [_vRegisterBtn setTitleColor:kColorMainOrange forState:UIControlStateNormal];
    _vRegisterBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_contentView addSubview:_vRegisterBtn];
    [_vRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vGrid2.mas_bottom).offset(110.f);
        make.centerX.mas_equalTo(0);
    }];
    
    _wechatBtn = [UIButton new];
    [_wechatBtn setImage:[UIImage imageNamed:@"icon_wechat"] forState:UIControlStateNormal];
    [_contentView addSubview:_wechatBtn];
    [_wechatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(vGrid2.mas_bottom).mas_offset(146.f);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(48, 48));
    }];
    
    kWeakSelf(_wechatBtn);
    _QQBtn = [UIButton new];
    [_QQBtn setImage:[UIImage imageNamed:@"icon_QQ"] forState:UIControlStateNormal];
    [_contentView addSubview:_QQBtn];
    [_QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(vGrid2.mas_bottom).mas_offset(146.f);
        make.right.mas_equalTo(weak__wechatBtn.mas_left).mas_offset(-9);
        make.size.mas_equalTo(CGSizeMake(48, 48));
    }];
    
    _sinaBtn = [UIButton new];
    [_sinaBtn setImage:[UIImage imageNamed:@"icon_sina"] forState:UIControlStateNormal];
    [_contentView addSubview:_sinaBtn];
    [_sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(vGrid2.mas_bottom).mas_offset(146.f);
        make.left.mas_equalTo(weak__wechatBtn.mas_right).mas_offset(9);
        make.size.mas_equalTo(CGSizeMake(48, 48));
    }];
    
    // bind events
    [_vLoginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [_vForgetBtn addTarget:self action:@selector(clickForgetBtn) forControlEvents:UIControlEventTouchUpInside];
    [_vRegisterBtn addTarget:self action:@selector(clickRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    [_QQBtn addTarget:self action:@selector(clickQQBtn) forControlEvents:UIControlEventTouchUpInside];
    [_wechatBtn addTarget:self action:@selector(clickWechatBtn) forControlEvents:UIControlEventTouchUpInside];
    [_sinaBtn addTarget:self action:@selector(clickSinaBtn) forControlEvents:UIControlEventTouchUpInside];
    return self;
}


#pragma mark - click actions

- (void)clickLoginBtn;
{
    NSString *mobile = _vMobileText.text;
    NSString *password = _vPasswordText.text;
    
    //去除两端空格
    mobile = [mobile stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    password = [password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //去除两端空格和回车
    mobile = [mobile stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    password = [password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [self.delegate doClickLoginBtnWithMobile:mobile password:password];
}

- (void)clickForgetBtn
{
    [self.delegate doClickForgetBtn];
}

- (void)clickRegisterBtn
{
    [self.delegate doClickRegisterBtn];
}

- (void)clickQQBtn
{
    [self.delegate doClickQQBtn];
}

- (void)clickWechatBtn
{
    [self.delegate doClickWechatBtn];
}

- (void)clickSinaBtn
{
    [self.delegate doClickSinaBtn];
}


#pragma mark - <#Delegate#> -- 代理方法，每个代理新建一个mark。
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
