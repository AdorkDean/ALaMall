//
//  UserForgetPasswordController.m
//  ALaMall
//
//  Created by dongW on 19/04/15.
//  Copyright © 2019年 dongW. All rights reserved.

//  @license The MIT License (MIT)
//

#import "UserForgetPasswordController.h"
#import "UserForgetPasswordView.h"

@interface UserForgetPasswordController ()<UserForgetPasswordViewDelegate>
{
    UserForgetPasswordView * _vForgetView;
}

@end

@implementation UserForgetPasswordController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated: YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    
    
    _vForgetView = [[UserForgetPasswordView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _vForgetView.delegate = self;
    [self.view addSubview:_vForgetView];
    
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

- (void)doClickFindBtnWithMobile:(NSString *)mobile password:(NSString *)password
{
    
}

- (void)doClickVerificationBtn
{
    
}

@end
