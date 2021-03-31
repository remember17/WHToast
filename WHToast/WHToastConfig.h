//
//  WHToastConfig.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kToastConfig ([WHToastConfig sharedInstance])
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
#define kWHToastMultilineTextSize(text, font, maxSize) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define kWHToastMultilineTextSize(text, font, maxSize) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize] : CGSizeZero;
#endif
#define kWHToastScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kWHToastScreenHeight ([UIScreen mainScreen].bounds.size.height)

static inline UIWindow* whToast_currentWindow() {
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
@property (nonatomic, strong) UIColor *iconColor;
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, assign) CGSize tipImageSize;

@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat imageCornerRadius;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) CGFloat minWidth;

- (void)resetConfig;

@end
