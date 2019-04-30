//
//  UserRegisterView.m
//  ALaMall
//
//  Created by 董伟 on 2019/4/20.
//  Copyright © 2019 ZBJT. All rights reserved.
//

#import "UserRegisterView.h"


#pragma mark - Define&StaticVar -- 静态变量和Define声明


@interface UserRegisterView ()<UITextFieldDelegate>
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
    UIImageView *_vCheckIcon;
    UITextField *_vCheckText;
    UILabel *_vGrid3Underline;
    
    //gird4
    UITextField *_vVerificationText;
    UIButton *_vVerificationBtn;
    UILabel *_vGrid4Underline;
    
    UIButton *_vRegisterBtn;
    
}

@end

@implementation UserRegisterView


#pragma mark - Life Circle -- 生命周期和初始化设置
/**
 *  视图初始化
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configUserRegisterViewViewAndConstraint];
    }
    return self;
}


#pragma mark - Config Constraint -- 视图布局配置

/**
 *  初始化View对象并设置View之间的约束
 */
- (void)configUserRegisterViewViewAndConstraint {
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
    
    //划分为四个grid
    UIView *vGrid1 = [UIView new];
    UIView *vGrid2 = [UIView new];
    UIView *vGrid3 = [UIView new];
    UIView *vGrid4 = [UIView new];
    
    [_contentView addSubview:vGrid1];
    [_contentView addSubview:vGrid2];
    [_contentView addSubview:vGrid3];
    [_contentView addSubview:vGrid4];
    
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
    [vGrid3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vGrid1);
        make.right.equalTo(vGrid1);
        make.top.equalTo(vGrid2.mas_bottom);
        make.height.mas_equalTo(vGrid1);
    }];
    [vGrid4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vGrid1);
        make.right.equalTo(vGrid1);
        make.top.equalTo(vGrid3.mas_bottom);
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
    _vMobileText.placeholder = @"请输入您的手机号";
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
    _vPasswordText.placeholder = @"请输入您的密码密码";
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
    
    //_vCheckIcon
    _vCheckIcon = [UIImageView new];
    _vCheckIcon.image = [UIImage imageNamed:@"icon_check"];
    [vGrid3 addSubview:_vCheckIcon];
    [_vCheckIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-14);
        make.centerY.mas_equalTo(0);
    }];
    
    //_vCheckText
    _vCheckText = [UITextField new];
    _vCheckText.placeholder = @"请再次确认您的密码";
    _vCheckText.secureTextEntry = YES;
    _vCheckText.delegate = self;
    _vCheckText.keyboardType = UIKeyboardTypeASCIICapable;
    [vGrid3 addSubview:_vCheckText];
    [_vCheckText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.centerY.mas_equalTo(vGrid3);
        make.right.mas_equalTo(-35);
    }];
    
    //_vGrid3Underline
    _vGrid3Underline = [UILabel new];
    _vGrid3Underline.backgroundColor = [UIColor hexColor:@"e1e1e1"];
    [vGrid3 addSubview:_vGrid3Underline];
    [_vGrid3Underline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vGrid3);
        make.right.equalTo(vGrid3);
        make.top.equalTo(vGrid3.mas_baseline);
        make.height.mas_equalTo(1);
    }];
    
    //_vVerificationText
    _vVerificationText = [UITextField new];
    _vVerificationText.placeholder = @"输入验证码";
    _vVerificationText.delegate = self;
    _vVerificationText.font = [UIFont systemFontOfSize:14];
    [vGrid4 addSubview:_vVerificationText];
    [_vVerificationText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14.f);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(150.f, 14));
    }];
    
    _vVerificationBtn = [UIButton new];
    [_vVerificationBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_vVerificationBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [_vVerificationBtn setBackgroundColor:kColorMainOrange];
    _vVerificationBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    _vVerificationBtn.layer.cornerRadius = 12.f;
    [vGrid4 addSubview:_vVerificationBtn];
    [_vVerificationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(70, 25));
    }];
    
    _vGrid4Underline = [UILabel new];
    _vGrid4Underline.backgroundColor = [UIColor hexColor:@"e1e1e1"];
    [vGrid4 addSubview:_vGrid4Underline];
    [_vGrid4Underline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vGrid4);
        make.right.equalTo(vGrid4);
        make.top.equalTo(vGrid4.mas_baseline);
        make.height.mas_equalTo(1);
    }];
    
    //_vRegisterBtn
    _vRegisterBtn = [UIButton new];
    [_vRegisterBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_vRegisterBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
    [_vRegisterBtn setBackgroundColor:kColorMainOrange];
    _vRegisterBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _vRegisterBtn.layer.cornerRadius = 20.f;
    [_contentView addSubview:_vRegisterBtn];
    [_vRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(240.f);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(40.f);
        make.top.mas_equalTo(vGrid4.mas_bottom).mas_offset(80.f);
    }];
    
    //bind
    [_vVerificationBtn addTarget:self action:@selector(clickVerification)
                forControlEvents:UIControlEventTouchUpInside];
    [_vRegisterBtn addTarget:self action:@selector(clickRegist)
            forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Getter&Setter -- 懒加载


#pragma mark - Private -- 私有方法
- (void)clickRegist
{
    [self.delegate doClickRegisterBtnWithMobile:_vMobileText.text password:_vPasswordText.text];
}

- (void)clickVerification
{
    [self.delegate doClickVerificationBtn];
}

#pragma mark - Override -- 重写方法


#pragma mark - Public -- 公有方法


#pragma mark - <#Delegate#> -- 代理方法，每个代理新建一个mark。
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
