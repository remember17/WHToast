//
//  WHToast.m
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import "WHToast.h"
#import "WHToastView.h"
#import "WHToastConfig.h"

@interface WHToast()

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) WHToastView *toastView;
@property (nonatomic, strong) NSTimer *toastTimer;
@property (nonatomic, copy) dispatch_block_t finishHandler;

@end

@implementation WHToast

static id _instance;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

#pragma mark - show toast

/** 仅文字，展示在当前页面中间 */
+ (void)showMessage:(NSString * _Nullable)message
             inView:(UIView *)inView
           duration:(NSTimeInterval)duration
      finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeWords
                                     message:message
                                      inView:inView
                                     originY:0
                                       image:nil
                                    duration:duration
                               finishHandler:handler];
}

+ (void)showMessage:(NSString * _Nullable)message
            originY:(CGFloat)originY
           duration:(NSTimeInterval)duration
      finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeWords
                                     message:message
                                      inView:nil
                                     originY:originY
                                       image:nil
                                    duration:duration
                               finishHandler:handler];
}

+ (void)showImage:(UIImage * _Nullable)image
          message:(NSString * _Nullable)message
         duration:(NSTimeInterval)duration
    finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeImage
                                     message:message
                                      inView:nil
                                     originY:0
                                       image:image
                                    duration:duration
                               finishHandler:handler];
}

+ (void)showMessage:(NSString * _Nullable)message
           duration:(NSTimeInterval)duration
      finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeWords
                                     message:message
                                      inView:nil
                                     originY:0
                                       image:nil
                                    duration:duration
                               finishHandler:handler];
}

+ (void)showImage:(UIImage * _Nullable)image
          message:(NSString * _Nullable)message
          originY:(CGFloat)originY
         duration:(NSTimeInterval)duration
    finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeImage
                                     message:message
                                      inView:nil
                                     originY:originY
                                       image:image
                                    duration:duration
                               finishHandler:handler];
}

+ (void)hide {
    [[self sharedInstance] removeToast];
}

#pragma mark - configuration

+ (void)setShowMask:(BOOL)showMask {
    kToastConfig.showMask = showMask;
}

+ (void)setMaskColor:(UIColor *)maskColor {
    kToastConfig.maskColor = maskColor;
}

+ (void)setMaskCoverNav:(BOOL)maskCoverNav {
    kToastConfig.maskCoverNav = maskCoverNav;
}

+ (void)setLeftPadding:(CGFloat)leftPadding {
    kToastConfig.leftPadding = leftPadding;
}

+ (void)setTopPadding:(CGFloat)topPadding {
    kToastConfig.topPadding = topPadding;
}

+ (void)setMinTopMargin:(CGFloat)minTopMargin {
    kToastConfig.minTopMargin = minTopMargin;
}

+ (void)setMinLeftMargin:(CGFloat)minLeftMargin {
    kToastConfig.minLeftMargin = minLeftMargin;
}

+ (void)setTipImageSize:(CGSize)tipImageSize {
    kToastConfig.tipImageSize = tipImageSize;
}

+ (void)setCornerRadius:(CGFloat)cornerRadius {
    kToastConfig.cornerRadius = cornerRadius;
}

+ (void)setImageCornerRadius:(CGFloat)cornerRadius {
    kToastConfig.imageCornerRadius = cornerRadius;
}

+ (void)setBackColor:(UIColor *)backColor {
    kToastConfig.backColor = backColor;
}

+ (void)setTextColor:(UIColor *)textColor {
    kToastConfig.textColor = textColor;
}

+ (void)setFont:(UIFont *)font {
    kToastConfig.font = font;
}

+ (void)setLineSpacing:(CGFloat)lineSpacing {
    kToastConfig.lineSpacing = lineSpacing;
}

+ (void)setLineHeight:(CGFloat)lineHeight {
    kToastConfig.lineHeight = lineHeight;
}

+ (void)setTipImageBottomMargin:(CGFloat)tipImageBottomMargin {
    kToastConfig.tipImageBottomMargin = tipImageBottomMargin;
}

+ (void)resetConfig {
    [kToastConfig resetConfig];
}

#pragma mark - private

- (void)showToastWithType:(WHToastType)type
                  message:(NSString * _Nullable)message
                   inView:(UIView * _Nullable)inView
                  originY:(CGFloat)originY
                    image:(UIImage * _Nullable)image
                 duration:(NSTimeInterval)duration
            finishHandler:(dispatch_block_t _Nullable)handler {
    [self guard];
    self.finishHandler = handler;
    self.toastView = [WHToastView toastWithMessage:message
                                              type:type
                                           originY:originY
                                          tipImage:image];
    self.toastView.alpha = 0;
    UIView *containerView = nil == inView ? whToast_currentWindow() : inView;
    if (kToastConfig.showMask) {
        self.maskView = [self maskViewWithColor:kToastConfig.maskColor coverNav:kToastConfig.maskCoverNav];
        self.maskView.alpha = 0;
        [containerView addSubview:self.maskView];
        [containerView addSubview:self.toastView];
    } else {
        [containerView addSubview:self.toastView];
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.maskView.alpha = 1;
        self.toastView.alpha = 1;
    }];
    [self duration:duration];
}

- (void)guard {
    if (self.toastView.superview != nil || self.toastView) {
        [self removeToast];
    }
}

- (void)duration:(NSTimeInterval)duration {
    self.toastTimer = [NSTimer scheduledTimerWithTimeInterval:duration
                                                       target:self
                                                     selector:@selector(finishDismiss)
                                                     userInfo:nil
                                                      repeats:NO];
}

- (void)finishDismiss {
    [UIView animateWithDuration:1 animations:^{ }];
    [self removeToast];
    if (self.finishHandler) { self.finishHandler(); }
}

- (void)removeToast {
    [self.toastTimer invalidate];
    self.toastTimer = nil;
    [self.toastView removeFromSuperview];
    [self.maskView removeFromSuperview];
    self.toastView = nil;
    self.maskView = nil;
}

- (UIView *)maskViewWithColor:(UIColor *)color coverNav:(BOOL)coverNav {
    UIView *maskView = [[UIView alloc] init];
    CGFloat topHeight = Toast_isIphoneX() ? 88 : 64;
    CGFloat y = coverNav ? 0 : topHeight;
    maskView.frame = CGRectMake(0, y, kWHToastScreenWidth, kWHToastScreenHeight - y);
    maskView.backgroundColor = color;
    return maskView;
}

@end
