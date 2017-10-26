//
//  JarvisViewController.m
//  saber
//
//  Created by 韩建桥 on 2017/10/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "JarvisViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface JarvisViewController ()

@end

@implementation JarvisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn_click:(UIButton *)sender {
    [self.navigationController setNavigationBarHidden:true];
    NSLog(@"btn_click Button Pressed");
    NSURL *jsCodeLocation;
    
# if 1
    // get bundle file from server
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/2.bundle?platform=ios"];
# else
    // if choose this bundle file run command at project root:
    // react-native bundle --platform ios --dev false --entry-file index.js --bundle-output ios/main.jsbundle
    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"2" withExtension:@"jsbundle"];
# endif
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"saber"
                         initialProperties:
     @{
       @"scores" : @[
               @{
                   @"name" : @"Alex",
                   @"value": @"42"
                   },
               @{
                   @"name" : @"Joel",
                   @"value": @"10"
                   }
               ]
       }
                             launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    //[self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
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
