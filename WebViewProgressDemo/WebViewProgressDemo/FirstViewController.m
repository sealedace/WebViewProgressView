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

- (YHWebViewProgress *)progressProxy
{
    if (!_progressProxy) {
        _progressProxy = [[YHWebViewProgress alloc] init];
    }
    return _progressProxy;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建进度条
    YHWebViewProgressView *progressView = [[YHWebViewProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), CGRectGetWidth(self.view.bounds), 4)];
    progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    
    self.progressProxy.progressView = progressView;
    self.webView.delegate = self.progressProxy;
    self.progressProxy.webViewProxy = self;
    
    [self.view addSubview:progressView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.taobao.com"]]];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
