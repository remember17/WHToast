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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *test = @"仅仅是一个测试";
    UIImage *image = [UIImage imageNamed:@"123"];
    
    [WHToast showSuccessWithMessage:test dismissDelay:1 finishHandler:^{
        [WHToast showSuccessWithMessage:test originY:100 dismissDelay:1 finishHandler:^{
            [WHToast showErrorWithMessage:test dismissDelay:1 finishHandler:^{
                [WHToast showErrorWithMessage:test originY:200 dismissDelay:1 finishHandler:^{
                    [WHToast showMessage:test dismissDelay:1 finishHandler:^{
                        [WHToast showMessage:test originY:500 dismissDelay:1 finishHandler:^{
                            [WHToast showImage:image message:nil dismissDelay:1 finishHandler:^{
                                [WHToast showImage:image message:nil originY:100 dismissDelay:1 finishHandler:^{
                                    kToastConfig.tipImageSize = CGSizeMake(100, 50);
                                    kToastConfig.fontSize = 30;
                                    [WHToast showImage:image message:@"测试图片" originY:500 dismissDelay:1 finishHandler:^{
                                        kToastConfig.showMask = NO;
                                        kToastConfig.maskColor = [UIColor colorWithWhite:0 alpha:0.6];
                                        kToastConfig.maskCoverNav = NO;
                                        kToastConfig.tipImageSize = CGSizeMake(50, 50);
                                        kToastConfig.fontSize = 30;
                                        kToastConfig.padding = 20;
                                        kToastConfig.cornerRadius = 20;
                                        kToastConfig.iconColor = [UIColor redColor];
                                        kToastConfig.backColor = [UIColor lightGrayColor];
                                        kToastConfig.messageColor = [UIColor blackColor];
                                        [WHToast showSuccessWithMessage:@"修改了默认配置信息" originY:500 dismissDelay:1 finishHandler:^{
                                            [kToastConfig resetConfig];
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
