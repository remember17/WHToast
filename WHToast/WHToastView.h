//
//  WHToastView.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//  https://github.com/remember17/WHToast

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WHToastType) {
    WHToastTypeSuccess = 0,
    WHToastTypeError,
    WHToastTypeWords,
    WHToastTypeImage,
};

@interface WHToastView : UIView

+ (instancetype)toastWithMessage:(NSString *)message type:(WHToastType)type originY:(CGFloat)originY tipImage:(UIImage *)image;

+ (UIView *)maskViewWithColor:(UIColor *)color coverNav:(BOOL)coverNav;

@end

static inline BOOL Toast_isIphoneX() {
    BOOL result = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return result;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            result = YES;
        }
    }
    return result;
}
