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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    WKWebViewConfiguration *theConfiguration =
    [[WKWebViewConfiguration alloc] init];
    [theConfiguration.userContentController
     addScriptMessageHandler:self name:@"interOp"];

  [_webView loadRequest:request];
  [self.view addSubview:_webView];

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

@end
