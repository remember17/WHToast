//
//  WHToastConfig.h
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//  https://github.com/remember17/WHToast

#import <UIKit/UIKit.h>
#define kToastConfig ([WHToastConfig sharedInstance])

@interface WHToastConfig : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
+ (instancetype)sharedInstance;
@property (nonatomic, assign) BOOL showMask;
@property (nonatomic, strong) UIColor *maskColor;
@property (nonatomic, assign) BOOL maskCoverNav;
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) CGSize tipImageSize;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, strong) UIColor *iconColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) CGFloat fontSize;
- (void)resetConfig;

@end
