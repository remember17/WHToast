//
//  WHToastConfig.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kToastConfig ([WHToastConfig sharedInstance])
#define kWHToastScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kWHToastScreenHeight ([UIScreen mainScreen].bounds.size.height)

static inline UIWindow *whToast_currentWindow() {
    UIWindow* window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        window = [UIApplication sharedApplication].keyWindow;
#pragma clang diagnostic pop
    }
    return window;
}

static inline BOOL Toast_isIphoneX() {
    BOOL result = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return result;
    }
    if (@available(iOS 11.0, *)) {
        if (whToast_currentWindow().safeAreaInsets.bottom > 0.0) {
            result = YES;
        }
    }
    return result;
}

@interface WHToastConfig : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance;

@property (nonatomic, assign) BOOL showMask;
@property (nonatomic, assign) BOOL maskCoverNav;

@property (nonatomic, strong) UIColor *maskColor;
@property (nonatomic, strong) UIColor *backColor;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) CGFloat lineHeight;
@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, assign) CGSize tipImageSize;
@property (nonatomic, assign) CGFloat tipImageBottomMargin;
@property (nonatomic, assign) CGFloat leftPadding;
@property (nonatomic, assign) CGFloat topPadding;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat imageCornerRadius;

@property (nonatomic, assign) CGFloat minWidth;
@property (nonatomic, assign) CGFloat minTopMargin;
@property (nonatomic, assign) CGFloat minLeftMargin;

- (void)resetConfig;

@end
