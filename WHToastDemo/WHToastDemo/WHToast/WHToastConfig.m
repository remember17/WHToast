//
//  WHToastConfig.m
//  WHToast
//
//  Created by wuhao on 2018/11/15.
//  Copyright © 2018 wuhao. All rights reserved.
//  https://github.com/remember17/WHToast

#import "WHToastConfig.h"

@implementation WHToastConfig

static id _instance;
+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self resetConfig];
    }
    return self;
}

- (void)resetConfig {
    _showMask = YES;
    _maskColor = [UIColor clearColor];
    _maskCoverNav = YES;
    _padding = 12;
    _tipImageSize = CGSizeMake(25, 25);
    _cornerRadius = 7;
    _backColor = [UIColor colorWithWhite:0 alpha:0.8];
    _iconColor = [UIColor whiteColor];
    _textColor = [UIColor whiteColor];
    _fontSize = 15;
}

@end
