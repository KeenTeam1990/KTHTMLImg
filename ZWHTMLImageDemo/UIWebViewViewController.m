//
//  UIWebViewViewController.m
//  ZWHTMLImageDemo
//
//  Created by kt on 2017/6/7.
//  Copyright © 2017年 keenteam. All rights reserved.
//

#import "UIWebViewViewController.h"
#import <ZWPreviewImage/ZWPreviewImageView.h>
#import "ZWHTMLSDK.h"
@interface UIWebViewViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
/** */
@property (nonatomic, strong) ZWHTMLSDK *htmlSDK;
@end

@implementation UIWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configWebView];
}
#pragma mark - config
- (void)configWebView{
    NSURL *url = [NSURL URLWithString:@"http://www.jianshu.com/p/4fb95a281787"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];

    self.webView.delegate = self;
}
#pragma mark - lifeCycle
#pragma mark - delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{

    self.htmlSDK = [ZWHTMLSDK zw_loadStandardBridgeJSWebview:webView];
    self.htmlSDK.blockHandlePreview = ^(NSArray *allImageArray, NSInteger index) {
        ZWPreviewImageView *showView = [ZWPreviewImageView showImageWithArray:allImageArray withShowIndex:index];
        [showView showRootWindow];
    };
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([self.htmlSDK zw_handlePreviewImageRequest:request]) {
        return NO;
    }
    return YES;
}
#pragma mark - actionFunction
#pragma mark - function
#pragma mark - layzing

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
