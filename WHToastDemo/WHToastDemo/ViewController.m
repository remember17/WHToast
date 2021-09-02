//
//  ViewController.m
//  WHToastDemo
//
//  Created by 吴浩 on 2021/3/31.
//

#import "ViewController.h"
#import <WHToast.h>

@implementation ViewController

- (IBAction)action:(UIButton *)button {
    switch (button.tag) {
        case 0:
            [WHToast showMessage:@"显示在当前页面的view上" inView:self.view duration:2 finishHandler:^{
                
            }];
            break;
        case 1:
            [WHToast showMessage:@"显示在window上" duration:2 finishHandler:^{
                
            }];
            break;
        case 2:
            [WHToast showMessage:@"自定义originY显示在window上" originY:100 duration:2 finishHandler:^{
                
            }];
            break;
        case 3:
            [WHToast showImage:[UIImage imageNamed:@"123"] message:@"显示图片和文字" duration:2 finishHandler:^{
                
            }];
            break;
        case 4:
            [WHToast showImage:[UIImage imageNamed:@"123"] message:@"自定义originY显示图片和文字" originY:100 duration:2 finishHandler:^{
                
            }];
            break;
        case 5:
            [WHToast setTipImageSize:CGSizeMake(100, 100)];
            [WHToast showImage:[UIImage imageNamed:@"789"] message:nil duration:2 finishHandler:^{
                [WHToast resetConfig];
            }];
            break;
        default:
            break;
    }
}

@end
