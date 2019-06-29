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

- (IBAction)action:(UIButton *)button {
    CGFloat customY = self.view.bounds.size.height - 200;
    switch (button.tag) {
        case 0:
            [WHToast showSuccessWithMessage:@"成功的提示信息" duration:2 finishHandler:^{
                NSLog(@"成功信息显示完成");
            }];
            break;
        case 1:
            [WHToast showSuccessWithMessage:@"成功的提示信息" originY:customY duration:2 finishHandler:^{
                NSLog(@"y成功信息显示完成");
            }];
            break;
        case 2:
            [WHToast showErrorWithMessage:@"错误的信息提示" duration:2 finishHandler:^{
                NSLog(@"错误的信息提示完成");
            }];
            break;
        case 3:
            [WHToast showErrorWithMessage:@"错误的提示信息" originY:customY duration:2 finishHandler:^{
                NSLog(@"y错误的信息提示完成");
            }];
            break;
        case 4:
            [WHToast showMessage:@"仅提示文字" duration:2 finishHandler:^{
                NSLog(@"仅提示文字完成");
            }];
            break;
        case 5:
            [WHToast showMessage:@"仅提示文字" originY:customY duration:2 finishHandler:^{
                NSLog(@"y仅提示文字完成");
            }];
            break;
        case 6:
            // message传nil仅显示图片
            [WHToast setTipImageSize:CGSizeMake(120, 60)];
            [WHToast showImage:[UIImage imageNamed:@"123"] message:nil duration:2 finishHandler:^{
                [WHToast resetConfig];
                NSLog(@"仅显示图片完成");
            }];
            break;
        case 7:
            // message传nil仅显示图片，自定义y
            [WHToast setTipImageSize:CGSizeMake(120, 120)];
            [WHToast showImage:[UIImage imageNamed:@"789"] message:nil duration:2 finishHandler:^{
                [WHToast resetConfig];
                NSLog(@"y仅显示图片完成");
            }];
            break;
        case 8:
            //👇全局自定义显示样式，有默认值
            [WHToast setShowMask:YES];
            [WHToast setMaskColor:[UIColor colorWithWhite:0 alpha:0.3]];
            [WHToast setMaskCoverNav:YES];
            [WHToast setPadding:20];
            [WHToast setTipImageSize:CGSizeMake(50, 50)];
            [WHToast setCornerRadius:10];
            [WHToast setImageCornerRadius:25];
            [WHToast setBackColor:[self whToast_colorFromHexString:@"#00A0FF" alpha:0.2]];
            [WHToast setIconColor:[UIColor whiteColor]];
            [WHToast setTextColor:[UIColor whiteColor]];
            [WHToast setFontSize:18];
            [WHToast showImage:[UIImage imageNamed:@"789"] message:@"自定义显示样式" duration:2 finishHandler:^{
                NSLog(@"自定义显示样式完成");
                [WHToast resetConfig];
            }];
            break;
        default:
            break;
    }
}

- (UIColor *)whToast_colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
