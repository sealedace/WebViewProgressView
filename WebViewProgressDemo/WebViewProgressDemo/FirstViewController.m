//
//  FirstViewController.m
//  WebViewProgressDemo
//
//  Created by gaoqiang xu on 3/27/15.
//  Copyright (c) 2015 gaoqiang. All rights reserved.
//

#import "FirstViewController.h"
#import "YHWebViewProgress.h"
#import "YHWebViewProgressView.h"

@interface FirstViewController ()
<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) YHWebViewProgress *progressProxy;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建进度条代理，用于处理进度控制
    _progressProxy = [[YHWebViewProgress alloc] init];
    
    // 创建进度条
    YHWebViewProgressView *progressView = [[YHWebViewProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), CGRectGetWidth(self.view.bounds), 4)];
    progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    
    // 设置进度条
    self.progressProxy.progressView = progressView;
    // 将UIWebView代理指向YHWebViewProgress
    self.webView.delegate = self.progressProxy;
    // 设置webview代理转发到self（可选）
    self.progressProxy.webViewProxy = self;
    
    // 添加到视图
    [self.view addSubview:progressView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.taobao.com"]]];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
