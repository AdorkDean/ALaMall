//
//  UserLoginController.m
//  ALaMall
//
//  Created by dongW on 19/04/15.
//  Copyright © 2019年 dongW. All rights reserved.
//
//
//
//  @license The MIT License (MIT)
//

#import "UserLoginController.h"
#import "UserRegisterViewController.h"
#import "UserForgetPasswordController.h"
#import "UserLoginView.h"
#import "User.h"
#import "ValidatorUtil.h"

@interface UserLoginController () <UserLoginViewDelegate>
{
    UserLoginView *_vLoginView;
}
@end

@implementation UserLoginController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated: YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    
    _vLoginView = [[UserLoginView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _vLoginView.delegate = self;
    [self.view addSubview:_vLoginView];
    
    UIButton * popBtn = [UIButton new];
    [popBtn setImage:[UIImage imageNamed:@"icon_pop"] forState:UIControlStateNormal];
    [popBtn addTarget:self action:@selector(clickPopBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popBtn];
    [popBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12.f);
        make.top.mas_equalTo(32.f);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickPopBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UserLoginViewDelegate

- (void)doClickLoginBtnWithMobile:(NSString *)mobile password:(NSString *)password
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
    [User loginWithMobile:mobile password:password success:^(NSNumber *code, NSString *message, NSDictionary *data) {
        if (code.integerValue == 0) {
            [[NSUserDefaults standardUserDefaults] setObject:data[@"session"] forKey:kStorageUserSession];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self toast:@"登录成功" seconds:2.0];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [self toast:message seconds:2.0];
        }
        [self hideLoadingView];
    } failure:^(NSError *error) {
        [self toastWithError:error];
        [self hideLoadingView];
    }];
}

- (void)doClickForgetBtn
{
    UserForgetPasswordController *ctrl = [UserForgetPasswordController new];
    [self.navigationController pushViewController:ctrl animated:YES];
}

- (void)doClickRegisterBtn
{
    UserRegisterViewController *ctrl = [UserRegisterViewController new];
    [self.navigationController pushViewController:ctrl animated:YES];
}

- (void)doClickQQBtn {
    
}


- (void)doClickSinaBtn {
    
}


- (void)doClickWechatBtn {
    
}


@end
