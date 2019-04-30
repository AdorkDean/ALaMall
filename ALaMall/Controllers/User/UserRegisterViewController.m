//
//  UserRegisterViewController.m
//  ALaMall
//
//  Created by 董伟 on 2019/4/20.
//  Copyright © 2019 ZBJT. All rights reserved.
//

#import "UserRegisterViewController.h"
#import "UserRegisterView.h"
#import "ValidatorUtil.h"

#pragma mark - Define&StaticVar -- 静态变量和Define声明


@interface UserRegisterViewController ()<UserRegisterViewDelegate>
{
    UserRegisterView * _vRegisterView;
}

@end

@implementation UserRegisterViewController


#pragma mark - Life Circle -- 生命周期和初始化设置

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUserRegisterViewControllerViewAndConstraint];
}

#pragma mark - Config Constraint -- 视图布局配置

/**
 *  初始化View对象并设置View之间的约束
 */
- (void)configUserRegisterViewControllerViewAndConstraint {
    [self.navigationController setNavigationBarHidden:YES animated: YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    
    
    _vRegisterView = [[UserRegisterView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _vRegisterView.delegate = self;
    [self.view addSubview:_vRegisterView];
    
    UIButton * popBtn = [UIButton new];
    [popBtn setImage:[UIImage imageNamed:@"icon_pop"] forState:UIControlStateNormal];
    [popBtn addTarget:self action:@selector(clickPopBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
    [popBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12.f);
        make.top.mas_equalTo(32.f);
    }];
}

#pragma mark - Getter&Setter -- 懒加载


#pragma mark - Private -- 私有方法
- (void)clickPopBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Override -- 重写方法


#pragma mark - Public -- 公有方法


#pragma mark - UserRegisterViewDelegate -- 代理方法，每个代理新建一个mark。
- (void)doClickRegisterBtnWithMobile:(NSString *)mobile password:(NSString *)password
{
    NSError *error = nil;
    if (![ValidatorUtil isValidMobile:mobile error:&error]) {
        [self toast:[error localizedDescription]];
        return;
    }
    if (password.length <= 0) {
        [self toast:@"密码不能为空"];
        return;
    }
    
    [self showLoadingView];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   mobile,   @"user_name",
                                   password, @"password", nil];
    
    
    [HttpClient requestJson:kUrlUserRegister
                     params:params
                    success:^(BOOL result, NSNumber *resultCode, NSString *message, NSDictionary *data) {
                        [self toast:@"注册成功"];
                        [self hideLoadingView];
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    failure:^(NSError *error) {
                        [self toastWithError:error];
                        [self hideLoadingView];
                    }];
}

- (void)doClickVerificationBtn
{
    
}

@end
