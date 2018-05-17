# WebViewProgressView
WebView进度条


### How To Use
* **UIWebView模式:**

```objc
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
```

* **WKWebView模式:**

```objc
// 创建进度条
YHWebViewProgressView *progressView = [[YHWebViewProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), CGRectGetWidth(self.view.bounds), 4)];
progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
// 指定WKWebView对象来监听进度
[progressView useWkWebView:self.webView];
```

