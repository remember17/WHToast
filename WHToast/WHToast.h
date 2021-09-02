//
//  WHToast.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHToast : NSObject

/** 仅文字，展示在当前页面中间 */
+ (void)showMessage:(NSString * _Nullable)message
             inView:(UIView * _Nullable)inView
           duration:(NSTimeInterval)duration
      finishHandler:(dispatch_block_t _Nullable)handler;

/** 仅文字，展示在屏幕中间 */
+ (void)showMessage:(NSString * _Nullable)message
           duration:(NSTimeInterval)duration
      finishHandler:(dispatch_block_t _Nullable)handler;

/** 仅文字，自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间 */
+ (void)showMessage:(NSString * _Nullable)message
            originY:(CGFloat)originY
           duration:(NSTimeInterval)duration
      finishHandler:(dispatch_block_t _Nullable)handler;

/** 自定义图片和文字，展示在屏幕中间。 如果message传入nil，则只显示图片 */
+ (void)showImage:(UIImage * _Nullable)image
          message:(NSString * _Nullable)message
         duration:(NSTimeInterval)duration
    finishHandler:(dispatch_block_t _Nullable)handler;

/** 自定义图片和文字，自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间。如果message传入nil，则只显示图片 */
+ (void)showImage:(UIImage * _Nullable)image
          message:(NSString * _Nullable)message
          originY:(CGFloat)originY
         duration:(NSTimeInterval)duration
    finishHandler:(dispatch_block_t _Nullable)handler;

/** 主动消失 */
+ (void)hide;

/**************************************************
 设置全局样式
 *****************************************************/

/** 是否有背景遮罩，默认无 */
+ (void)setShowMask:(BOOL)showMask;

/** 遮罩颜色，默认 [UIColor colorWithWhite:0 alpha:0.3] */
+ (void)setMaskColor:(UIColor * _Nonnull)maskColor;

/** 遮罩是否遮住导航栏，默认遮住 */
+ (void)setMaskCoverNav:(BOOL)maskCoverNav;

/** 横向内边距，默认26 */
+ (void)setLeftPadding:(CGFloat)leftPadding;

/** 纵向内边距，默认8 */
+ (void)setTopPadding:(CGFloat)topPadding;

/** 距离屏幕顶端最小距离，默认60 */
+ (void)setMinTopMargin:(CGFloat)minTopMargin;

/** 距离屏幕左右最小距离，默认40 */
+ (void)setMinLeftMargin:(CGFloat)minLeftMargin;

/** 提示图片尺寸，默认（50, 50）*/
+ (void)setTipImageSize:(CGSize)tipImageSize;

/** toast圆角，默认8 */
+ (void)setCornerRadius:(CGFloat)cornerRadius;

/** 提示图片圆角，默认8 */
+ (void)setImageCornerRadius:(CGFloat)cornerRadius;

/** 背景颜色，默认[UIColor colorWithWhite:0 alpha:0.7] */
+ (void)setBackColor:(UIColor * _Nonnull)backColor;

/** 文字颜色，默认白色 */
+ (void)setTextColor:(UIColor * _Nonnull)textColor;

/** 默认14 */
+ (void)setFont:(UIFont *_Nullable)font;

// 默认0
+ (void)setLineSpacing:(CGFloat)lineSpacing;

// 默认20
+ (void)setLineHeight:(CGFloat)lineHeight;

// 图片与文字的间距，默认8
+ (void)setTipImageBottomMargin:(CGFloat)tipImageBottomMargin;

/** 恢复默认配置 */
+ (void)resetConfig;

@end


