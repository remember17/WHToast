//
//  ViewController.m
//  WHToastDemo
//
//  Created by wuhao on 2018/11/16.
//  Copyright © 2018 wuhao. All rights reserved.
//  https://github.com/remember17/WHToast

#import "ViewController.h"
#import "WHToast/WHToast.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showDemo];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showDemo];
}

- (void)showDemo {
    
    [WHToast showSuccessWithMessage:@"成功icon提示" duration:1 finishHandler:^{
        [WHToast showSuccessWithMessage:@"成功icon文字，自定义y轴位置" originY:100 duration:1 finishHandler:^{
            [WHToast showErrorWithMessage:@"失败icon提示" duration:1 finishHandler:^{
                [WHToast showErrorWithMessage:@"失败icon文字，自定义y轴位置" originY:200 duration:1 finishHandler:^{
                    [WHToast showMessage:@"仅仅文字提示" duration:1 finishHandler:^{
                        [WHToast showMessage:@"仅仅文字提示，自定义y轴位置" originY:500 duration:1 finishHandler:^{
                            [WHToast setTipImageSize:CGSizeMake(120, 60)]; // 定义图片大小
                            [WHToast setBackColor:[UIColor clearColor]]; // 透明背景
                            [WHToast setPadding:0]; // 0边距
                            // 自定义图片，message传入nil ==> 只显示图片
                            [WHToast showImage:[UIImage imageNamed:@"123"] message:nil duration:1 finishHandler:^{
                                // 自定义图片和y轴位置，message传入nil ==> 只显示图片
                                [WHToast setTipImageSize:CGSizeMake(120, 120)];
                                [WHToast showImage:[UIImage imageNamed:@"789"] message:nil originY:100 duration:1 finishHandler:^{
                                    [WHToast resetConfig]; // 恢复默认配置
                                    [WHToast setTipImageSize:CGSizeMake(100, 50)];
                                    [WHToast setFontSize:30]; // 定义字体大小
                                    [WHToast showImage:[UIImage imageNamed:@"123"] message:@"测试图片，自定义y轴位置" originY:500 duration:1 finishHandler:^{
                                        //👇全局自定义显示样式，有默认值
                                        [WHToast setShowMask:YES];
                                        [WHToast setMaskColor:[UIColor colorWithWhite:0 alpha:0.6]];
                                        [WHToast setMaskCoverNav:YES];
                                        [WHToast setTipImageSize:CGSizeMake(50, 50)];
                                        [WHToast setFontSize:30];
                                        [WHToast setPadding:20];
                                        [WHToast setCornerRadius:20];
                                        [WHToast setIconColor:[UIColor blackColor]];
                                        [WHToast setBackColor:[UIColor whiteColor]];
                                        [WHToast setTextColor:[UIColor blackColor]];
                                        [WHToast showSuccessWithMessage:@"自定义显示样式" originY:500 duration:1 finishHandler:^{
                                            [WHToast resetConfig];
                                        }];
                                    }];
                                }];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
    
}

@end
