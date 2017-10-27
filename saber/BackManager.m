//
//  BackManage.m
//  saber
//
//  Created by 韩建桥 on 2017/10/27.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "BackManager.h"
#import <React/RCTLog.h>
#import "ViewController2.h"

@implementation BackManager

static ViewController2 *controller;



// To export a module named CalendarManager
RCT_EXPORT_MODULE();



// This would name the module AwesomeCalendarManager instead
// RCT_EXPORT_MODULE(AwesomeCalendarManager);

RCT_EXPORT_METHOD(popLastViewController) {
  dispatch_async(dispatch_get_main_queue(), ^{
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController setNavigationBarHidden:false];
    [navigationController popViewControllerAnimated:YES];
  });
}

@end
