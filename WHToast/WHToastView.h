//
//  WHToastView.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WHToastType) {
    WHToastTypeSuccess = 0,
    WHToastTypeError,
    WHToastTypeWords,
    WHToastTypeImage,
};

@interface WHToastView : UIView

+ (instancetype _Nullable)toastWithMessage:(NSString * _Nullable)message
                            type:(WHToastType)type
                         originY:(CGFloat)originY
                        tipImage:(UIImage * _Nullable)image;

@end
