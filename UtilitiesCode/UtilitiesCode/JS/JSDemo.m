//
//  JSDemo.m
//  Utilities
//
//  Created by Eddy on 16/1/15.
//  Copyright © 2016年 ed. All rights reserved.
//

#import "JSDemo.h"

@interface JSDemo ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *myWebView;

@end

@implementation JSDemo

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"raiders" ofType:@"html"];
    NSString *h5String = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [_myWebView loadHTMLString:h5String baseURL:[NSURL fileURLWithPath:filePath]];
    [self.view addSubview:_myWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
