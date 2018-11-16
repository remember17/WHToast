//
//  WHToast.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//  https://github.com/remember17/WHToast

#import <UIKit/UIKit.h>
#import "WHToastConfig.h"

@interface WHToast : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 文字，展示在屏幕中间
 */
+ (void)showMessage:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，可自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 */
+ (void)showMessage:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有成功图标，展示在屏幕中间
 */
+ (void)showSuccessWithMessage:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有成功图标，可自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 */
+ (void)showSuccessWithMessage:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有失败图标，展示在屏幕中间
 */
+ (void)showErrorWithMessage:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有失败图标，可自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 */
+ (void)showErrorWithMessage:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，自定义图片，展示在屏幕中间。如果message传入nil，则只显示图片
 
 */
+ (void)showImage:(UIImage *)image message:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，自定义图片，自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 如果message传入nil，则只显示图片
 */
+ (void)showImage:(UIImage *)image message:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 主动消失
 */
+ (void)hide;


/**
 恢复默认配置
 */
+ (void)resetConfig;

@end

