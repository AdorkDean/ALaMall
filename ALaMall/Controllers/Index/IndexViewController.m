//
//  IndexViewController.m
//  ALaMall
//
//  Created by 董伟 on 2019/6/8.
//  Copyright © 2019 ZBJT. All rights reserved.
//

#import "IndexViewController.h"
#import <WebKit/WebKit.h>
#import "UserLoginController.h"
#import "OrderViewController.h"

#pragma mark - Define&StaticVar -- 静态变量和Define声明


@interface IndexViewController ()<WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong) WKWebView * webView;

@end

@implementation IndexViewController


#pragma mark - Life Circle -- 生命周期和初始化设置

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self configIndexViewControllerViewAndConstraint];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //状态栏
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor colorWithRed:230.f/255.f green:1.f/255.f blue:17.f/255.f alpha:0.8];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //状态栏
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor clearColor];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark - Config Constraint -- 视图布局配置

/**
 *  初始化View对象并设置View之间的约束
 */
- (void)configIndexViewControllerViewAndConstraint {
//    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
//
//    config.allowsInlineMediaPlayback = YES;
//    config.mediaPlaybackRequiresUserAction = NO;
    
    // 注入用户js
//    NSString *startJsString = @"";
//    WKUserScript *startUserScript = [[WKUserScript alloc] initWithSource:startJsString
//                                                           injectionTime:WKUserScriptInjectionTimeAtDocumentStart
//                                                        forMainFrameOnly:YES];
//    [config.userContentController addUserScript:startUserScript];
//
//    NSString *endJsString = @"";
//    WKUserScript *endUserScript = [[WKUserScript alloc] initWithSource:endJsString
//                                                         injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
//                                                      forMainFrameOnly:YES];
//    [config.userContentController addUserScript:endUserScript];
//
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
    NSString * url = @"http://www.blhzsqp.com/index.php/wap/index/indexs";
    if (session.length > 0) {
        url = [NSString stringWithFormat:@"%@?session=%@", url,session];
    }
    
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

#pragma mark - Override -- 重写方法


#pragma mark - Public -- 公有方法


#pragma mark - WKNavigationDelegate -- 代理方法，每个代理新建一个mark。
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
    if ([url containsString:@"myorderlist"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        OrderViewController * orderCv = [OrderViewController new];
        orderCv.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:orderCv animated:YES];
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    //    Decides whether to allow or cancel a navigation after its response is known.
    
    NSLog(@"知道返回内容之后，是否允许加载，允许加载");
    decisionHandler(WKNavigationResponsePolicyAllow);
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"开始加载");
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"跳转到其他的服务器");
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"网页由于某些原因加载失败");
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"网页开始接收网页内容");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"网页导航加载完毕");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable ss, NSError * _Nullable error) {
        NSLog(@"----document.title:%@---webView title:%@",ss,webView.title);
    }];
    
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败,失败原因:%@",[error description]);
    
}
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    NSLog(@"网页加载内容进程终止");
}

@end
