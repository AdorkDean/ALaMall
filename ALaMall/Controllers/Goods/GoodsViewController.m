//
//  GoodsViewController.m
//  ALaMall
//
//  Created by 董伟 on 2019/6/14.
//  Copyright © 2019 ZBJT. All rights reserved.
//

#import "GoodsViewController.h"
#import <WebKit/WebKit.h>
#import "UserLoginController.h"

#pragma mark - Define&StaticVar -- 静态变量和Define声明


@interface GoodsViewController ()<WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong) WKWebView * webView;

@end

@implementation GoodsViewController


#pragma mark - Life Circle -- 生命周期和初始化设置

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configGoodsViewControllerViewAndConstraint];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark - Config Constraint -- 视图布局配置

/**
 *  初始化View对象并设置View之间的约束
 */
- (void)configGoodsViewControllerViewAndConstraint {
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    webView.scrollView.maximumZoomScale = 1;
    webView.scrollView.minimumZoomScale = 1;
    [self.view addSubview:webView];
    self.webView = webView;
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self loadRequest];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadRequest) name:kNotifyPreorderUserLogin object:nil];
}

#pragma mark - Getter&Setter -- 懒加载


#pragma mark - Private -- 私有方法
- (void)loadRequest {
    NSString * session = [[NSUserDefaults standardUserDefaults] objectForKey:kStorageUserSession];
    NSString * goodsUrl = self.url;
    if (session.length > 0) {
        goodsUrl = [NSString stringWithFormat:@"%@&session=%@", goodsUrl,session];
    }
    
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:goodsUrl]];
    [self.webView loadRequest:request];
}

#pragma mark - Override -- 重写方法


#pragma mark - Public -- 公有方法


#pragma mark - <#Delegate#> -- 代理方法，每个代理新建一个mark。
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSMutableString *url=[[NSMutableString alloc]initWithString:[navigationAction.request.URL absoluteString]];
    NSLog(@"是否允许这个导航:%@", url);
    if ([url containsString:@"login"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        UserLoginController * userCv = [UserLoginController new];
        userCv.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:userCv animated:YES];
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
