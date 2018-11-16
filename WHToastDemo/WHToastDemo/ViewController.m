//
//  ViewController.m
//  WHToastDemo
//
//  Created by wuhao on 2018/11/16.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import "ViewController.h"
#import "WHToast/WHToast.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *test = @"仅仅是一个测试";
    UIImage *image = [UIImage imageNamed:@"123"];
    
    [WHToast showSuccessWithMessage:test dismissDelay:2 finishHandler:^{
        [WHToast showSuccessWithMessage:test originY:100 dismissDelay:2 finishHandler:^{
            [WHToast showErrorWithMessage:test dismissDelay:2 finishHandler:^{
                [WHToast showErrorWithMessage:test originY:200 dismissDelay:2 finishHandler:^{
                    [WHToast showMessage:test dismissDelay:2 finishHandler:^{
                        [WHToast showMessage:test originY:500 dismissDelay:2 finishHandler:^{
                            [WHToast showImage:image message:nil dismissDelay:2 finishHandler:^{
                                [WHToast showImage:image message:nil originY:100 dismissDelay:2 finishHandler:^{
                                    kToastConfig.tipImageSize = CGSizeMake(100, 50);
                                    kToastConfig.fontSize = 30;
                                    kToastConfig.padding = 20;
                                    kToastConfig.cornerRadius = 20;
                                    kToastConfig.backColor = [UIColor lightGrayColor];
                                    kToastConfig.messageColor = [UIColor blackColor];
                                    [WHToast showImage:image message:test dismissDelay:2 finishHandler:nil];
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
