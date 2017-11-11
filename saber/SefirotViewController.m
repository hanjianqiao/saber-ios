//
//  SefirotViewController.m
//  saber
//
//  Created by 韩建桥 on 2017/10/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "SefirotViewController.h"

@interface SefirotViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation SefirotViewController

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
  NSLog(@"didCommitNavigation...");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
  NSLog(@"Finish loading...");
}

- (void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
  if([navigationAction.request.URL.absoluteString hasPrefix:@"https"]){
    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"Load: %@", navigationAction.request.URL.absoluteString);
  }else if([navigationAction.request.URL.absoluteString hasPrefix:@"http"]){
    decisionHandler(WKNavigationActionPolicyCancel);
    NSLog(@"Not allow to load general web page: %@", navigationAction.request.URL.absoluteString);
  }else if([navigationAction.request.URL.absoluteString hasPrefix:@"safirot:openurl:"]){
    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"Load: %@", navigationAction.request.URL.absoluteString);
  }else{
    decisionHandler(WKNavigationActionPolicyCancel);
    NSLog(@"Not allow to load: %@", navigationAction.request.URL.absoluteString);
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  //NSURL *url = [NSURL URLWithString:@"https://lct.hanjianqiao.cn/safirot.sbr"];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
  [theConfiguration.userContentController addScriptMessageHandler:self name:@"interOp"];
  
  _webView.navigationDelegate = self;
  
  
  [_webView loadRequest:request];

}

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

- (void)userContentController:(nonnull WKUserContentController *)userContentController didReceiveScriptMessage:(nonnull WKScriptMessage *)message {
  return;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
  return;
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
  return;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
  return;
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
  return [super sizeForChildContentContainer:container withParentContainerSize:(CGSize)parentSize];
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
  return;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
  return;
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
  return;
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
  return;
}

- (void)setNeedsFocusUpdate {
  return;
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
  return true;
}

- (void)updateFocusIfNeeded {
  return;
}

@end
