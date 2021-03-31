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

+ (void)showSuccessWithMessage:(NSString * _Nullable)message
                      duration:(NSTimeInterval)duration
                 finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeSuccess
                                     message:message originY:0
                                       image:nil duration:duration
                               finishHandler:handler];
}

+ (void)showSuccessWithMessage:(NSString * _Nullable)message
                       originY:(CGFloat)originY
                      duration:(NSTimeInterval)duration
                 finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeSuccess
                                     message:message
                                     originY:originY
                                       image:nil
                                    duration:duration
                               finishHandler:handler];
}

+(void)showErrorWithMessage:(NSString * _Nullable)message
                   duration:(NSTimeInterval)duration
              finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeError
                                     message:message originY:0
                                       image:nil
                                    duration:duration
                               finishHandler:handler];
}

+ (void)showErrorWithMessage:(NSString * _Nullable)message
                     originY:(CGFloat)originY
                    duration:(NSTimeInterval)duration
               finishHandler:(dispatch_block_t _Nullable)handler {
    [[self sharedInstance] showToastWithType:WHToastTypeError
                                     message:message
                                     originY:originY
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

+ (void)setPadding:(CGFloat)padding {
    kToastConfig.padding = padding;
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

+ (void)setIconColor:(UIColor *)iconColor {
    kToastConfig.iconColor = iconColor;
}

+ (void)setTextColor:(UIColor *)textColor {
    kToastConfig.textColor = textColor;
}

+ (void)setFontSize:(CGFloat)fontSize {
    kToastConfig.fontSize = fontSize;
}

+ (void)resetConfig {
    [kToastConfig resetConfig];
}

#pragma mark - private

- (void)showToastWithType:(WHToastType)type
                  message:(NSString * _Nullable)message
                  originY:(CGFloat)originY
                    image:(UIImage * _Nullable)image
                 duration:(NSTimeInterval)duration
            finishHandler:(dispatch_block_t _Nullable)handler {
    [self guard];
    self.finishHandler = handler;
    self.toastView = [WHToastView toastWithMessage:message type:type originY:originY tipImage:image];
    self.toastView.alpha = 0;
    UIWindow *keyWindow = whToast_currentWindow();
    if (kToastConfig.showMask) {
        self.maskView = [self maskViewWithColor:kToastConfig.maskColor coverNav:kToastConfig.maskCoverNav];
        self.maskView.alpha = 0;
        [keyWindow addSubview:self.maskView];
        [keyWindow addSubview:self.toastView];
    } else {
        [keyWindow addSubview:self.toastView];
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
