//
//  WHToastConfig.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kToastConfig ([WHToastConfig sharedInstance])

@interface WHToastConfig : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 单例：kToastConfig
 */
+ (instancetype)sharedInstance;

/**
 是否有背景遮罩，默认有
 */
@property (nonatomic, assign) BOOL showMask;

/**
 遮罩颜色，默认透明
 */
@property (nonatomic, strong) UIColor *maskColor;

/**
 遮罩是否遮住导航栏，默认遮住
 */
@property (nonatomic, assign) BOOL maskCoverNav;

/**
 边距，默认12
 */
@property (nonatomic, assign) CGFloat padding;

/**
 提示图片尺寸，默认（30,30）
 */
@property (nonatomic, assign) CGSize tipImageSize;

/**
 圆角，默认7
 */
@property (nonatomic, assign) CGFloat cornerRadius;

/**
 背景颜色，默认[UIColor colorWithWhite:0 alpha:0.8]
 */
@property (nonatomic, strong) UIColor *backColor;

/**
 成功/失败 图标颜色，默认白色
 */
@property (nonatomic, strong) UIColor *iconColor;

/**
 文字颜色，默认白色
 */
@property (nonatomic, strong) UIColor *messageColor;

/**
 文字大小，默认15
 */
@property (nonatomic, assign) CGFloat fontSize;

/**
 恢复默认配置
 */
- (void)resetConfig;

@end
