# WHToast

WHToast是一个轻量级的提示控件，没有任何依赖。先来看一下效果图。

![WHToast.gif](https://upload-images.jianshu.io/upload_images/3873004-57cbafba5f019d2d.gif?imageMogr2/auto-orient/strip)

使用方法也非常简单，下面是使用步骤。

### 1. 可以直接在本页面下载文件拖入WHToast文件到工程，也可以使用pod。
```objc
pod 'WHToast'
```

### 2. 导图WHToast.h头文件

```objc
// pod
#import <WHToast.h>
// 直接拖入文件
#import "WHToast/WHToast.h"
```

### 3. 说明

> 每种显示类型都有两个方法，第一个方法默认显示在屏幕中间，第二个方法带有originY参数的是可以自定义显示位置，也就是自定义frame.origin.y。（注意：如果传入的originY<=0，也是显示在屏幕中间）。

### 4. 显示文字提示。

```objc
// 显示在页面中间，dismissDelay代表多久之后消失
[WHToast showMessage:@"测试一下" dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];

// 自定义frame.origin.y
[WHToast showMessage:@"测试一下" originY:200 dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];
```

### 5. 显示带有成功图标的提示。
```objc
// 显示在页面中间，dismissDelay代表多久之后消失
[WHToast showSuccessWithMessage:@"测试一下" dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];

// 自定义frame.origin.y
[WHToast showSuccessWithMessage:@"测试一下" originY:100 dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];
```

### 6. 带有错误图标的提示。

```objc
// 显示在页面中间，dismissDelay代表多久之后消失
[WHToast showErrorWithMessage:@"测试一下" dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];

// 自定义frame.origin.y
[WHToast showErrorWithMessage:@"测试一下" originY:200 dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];
```

### 7. 传入一个图片，自定义图标提示。

```objc
// 显示自定义图片，如果message传入nil，则只显示图片，dismissDelay代表多久之后消失
[WHToast showImage:[UIImage imageNamed:@"123"] message:nil dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];

// 自定义frame.origin.y，显示自定义图片
[WHToast showImage:[UIImage imageNamed:@"123"] message:@"测试一下" originY:200 dismissDelay:2 finishHandler:^{
  NSLog(@"省略n行代码");
}];
```

### 8. 自定义显示样式。

>WHToastConfig.h是一个单例，它的属性可以全局定义toast样式。可以像下面这样定义。

```objc 
kToastConfig.showMask =NO;
kToastConfig.maskColor = [UIColor blueColor];
kToastConfig.maskCoverNav = NO; kToastConfig.tipImageSize = CGSizeMake(100, 50);
kToastConfig.fontSize = 30;
kToastConfig.padding = 20;
kToastConfig.cornerRadius = 20;
kToastConfig.backColor = [UIColor lightGrayColor];
kToastConfig.iconColor = [UIColor redColor];
kToastConfig.messageColor = [UIColor blackColor];

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

```

### 9. WHToast的Api如下所示。

```objc
/**
 文字，展示在屏幕中间
 */
+ (void)showMessage:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，可自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 */
+ (void)showMessage:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有成功图标，展示在屏幕中间
 */
+ (void)showSuccessWithMessage:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有成功图标，可自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 */
+ (void)showSuccessWithMessage:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有失败图标，展示在屏幕中间
 */
+ (void)showErrorWithMessage:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，带有失败图标，可自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 */
+ (void)showErrorWithMessage:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，自定义图片，展示在屏幕中间。如果message传入nil，则只显示图片
 
 */
+ (void)showImage:(UIImage *)image message:(NSString *)message dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 文字，自定义图片，自定义frame.origin.y 如果（originY <= 0）会展示在屏幕中间
 如果message传入nil，则只显示图片
 */
+ (void)showImage:(UIImage *)image message:(NSString *)message originY:(CGFloat)originY dismissDelay:(NSTimeInterval)delay finishHandler:(dispatch_block_t)handler;


/**
 主动消失
 */
+ (void)hide;


/**
 恢复默认配置
 */
+ (void)resetConfig;
```
