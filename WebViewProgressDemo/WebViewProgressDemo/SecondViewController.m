//
//  SecondViewController.m
//  WebViewProgressDemo
//
//  Created by gaoqiang xu on 3/27/15.
//  Copyright (c) 2015 gaoqiang. All rights reserved.
//

#import "SecondViewController.h"
#import "YHWebViewProgressView.h"

@import WebKit;

@interface SecondViewController ()
<WKNavigationDelegate>
@property (strong, nonatomic) WKWebView *webView;

@end

@implementation SecondViewController

- (WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 创建进度条
    YHWebViewProgressView *progressView = [[YHWebViewProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), CGRectGetWidth(self.view.bounds), 4)];
    progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:self.webView];
    [progressView useWkWebView:self.webView];
    
    [self.webView addSubview:progressView];
    
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.navigationItem.title = change[@"new"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.taobao.com"]]];
}

#pragma mark - WKNavigationDelegate

@end
