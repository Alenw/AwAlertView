//
//  AwAlertView.h
//  test
//
//  Created by yelin on 16/5/23.
//  Copyright © 2016年 AlenW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AwTipViewStyleNone=0,//不显示图片
    AwTipViewStyleIndicatorMid,//显示进度指示器到中间
    AwTipViewStyleIndicatorLeft,//显示进度指示器到左边
    AwTipViewStyleDeterminate,
    AwTipViewStyleAnnularDeterminate,
    
    AwTipViewStyleDeterminateHorizontalBar,
}AwTipViewShowStyle;

typedef void (^AwTipViewCompletionBlock)();

@interface AwTipView : UIView
/**
 *  类方法，显示message到指定View
 *
 *  @param message 将要显示到message
 *  @param view    View
 */
+(void)showMessage:(nullable NSString *)message toView:(nonnull UIView *)view;
/**
 *  类方法，在View中移除AwTipView
 *
 *  @param view     view
 *  @param animated 是否动画
 */
+(void)hideForView:(nonnull UIView *)view Animated:(BOOL)animated;
/*!
 * 仅对除进度指示器之外的style有效,如:AwTipViewStyleNone,AwTipViewStyleIndicatorMid,AwTipViewStyleIndicatorLeft
 @property      showTime
 @abstract      展示的时间，可设置
 */
@property (nonatomic, assign) CGFloat showTime;

/*!
 @property      dimBackground
 @abstract      是否显示背景渐变色
 */
@property (nonatomic, assign) BOOL dimBackground;

@property (nonatomic, strong,nullable) UIColor *contentColor;
/**
 * The progress of the progress indicator, from 0.0 to 1.0. Defaults to 0.0.
 */
@property (assign, nonatomic) float progress;

/*!
 @method        initWithView:message:posY:
 @abstract      初始化方法
 @param         view  所在的view
 @param         message  展示内容
 @param         posY  离superView顶部的距离
 @result        BBTipView的对象
 */
- (nullable instancetype)initWithView:(nonnull UIView *)view message:(nullable NSString *)message posY:(CGFloat)posY;


- (nullable instancetype)initWithView:(nonnull UIView *)view title:(nullable NSString *)title message:(nullable NSString *)message posY:(CGFloat)posY;

- (nullable instancetype)initWithTipStyle:(AwTipViewShowStyle)style inView:(nonnull UIView *)view title:(nullable NSString *)title message:(nullable NSString *)message posY:(CGFloat)posY;

/*!
 @method        show
 @abstract      弹出
 */
- (void)showAnimated:(BOOL)animated;

/*!
 @param         animation 消失时是否使用动画
 */
- (void)hideAnimated:(BOOL)animated;
/**
 *  延迟隐藏AwTipView
 *
 *  @param animated 是否动画
 *  @param delay    延迟时间
 */
- (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

/**
 *  在当前view中查找是否存在AwTipView
 *
 *  @param view AwTipView显示的view
 *
 *  @return AwTipView or nil
 */
+ (nullable AwTipView *)HUDForView:(nonnull UIView *)view ;

/**
 *  默认执行完block中的内容会移除AwTipView
 *
 *  @param animated   是否启用动画
 *  @param block      显示AwTipView时候执行的block
 *  @param completion 完成时候执行的block
 */
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(nullable dispatch_block_t)block completionBlock:(nullable void (^)())completion ;
@end


typedef enum {
    AwAlertViewDefault=0,
    AwAlertViewStyle1,
    AwAlertViewStyle2,
    AwAlertViewStyle3
}AwAlertViewStyle;

typedef enum {
    AwAlertViewAniDefaul=0,
    AwAlertViewAniStyle1,
    AwAlertViewAniStyle2
}AwAlertViewAnimationStyle;

@class AwAlertView;
@protocol AwAlertViewDelegate <NSObject>
@optional
/** 按钮点击事件带领方法 */
// before animation and hiding view
- (void)awAlertView:(nonnull AwAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;

- (void)awAlertView:(nonnull AwAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
/** 暂未开放 */
- (void)didRotationToInterfaceOrientation:(BOOL)Landscape view:(nonnull UIView *)view alertView:(nonnull AwAlertView *)aletView;

@end

/**
 *  禁止使用［AwAlertView alloc］init]形式创建对象
 */
@interface AwAlertView : UIView
@property (nonatomic, weak) id<AwAlertViewDelegate> delegate;
@property (nonatomic, assign) AwAlertViewStyle awStyle;
/*!
 是否正在显示
 */
@property (nonatomic, readonly, getter=isVisible) BOOL visible;
/*!
 背景视图，覆盖全屏的，默认nil
 */
@property (nonatomic, strong,nullable) UIView *backgroundView;

/*****************************下面属性作用域**********************************/

/** 标题 */
@property (nonatomic, copy,nullable) NSString *title;
/** 标题字体颜色 */
@property (nonatomic, copy,nullable) UIColor *titleTextColor;

/** 信息 */
@property (nonatomic, copy,nullable) NSString *message;
/** 信息字体颜色 */
@property (nonatomic, copy,nullable) UIColor *messageTextColor;

/** 按钮颜色 */
@property (nonatomic, copy,nullable) UIColor *cancelTextColor;
/** 按钮图标 */
@property (nonatomic, strong,nullable) UIImage *cancelImage;
/** 按钮颜色 */
@property (nonatomic, copy,nullable) UIColor *otherTextColor;
/** 按钮图标 */
@property (nonatomic, strong,nullable) UIImage *otherImage;

/** 关闭按钮正常图片 */
@property (nonatomic, strong,nullable) UIImage *closeImage;
/** 关闭按钮高亮图片 */
@property (nonatomic, strong,nullable) UIImage *closeImage_hl;

/**
 *  标准样式AwAlertView
 *
 *  @param title      标题
 *  @param message    信息
 *  @param delegate   代理
 *  @param customview 自定义视图，可以是UIView,UITableView,...
 *  @param cancelText 取消按钮title
 *  @param otherText  其他按钮title
 *
 *  @return AwAlertView
 */
-(nullable instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id)delegate customView:(nullable UIView *)customview cancelTitle:(nullable NSString *)cancelText otherTitle:(nullable NSString *)otherText;
/**
 *  不同样式的AwAlertView初始化方法
 *
 *  @param awStyle    AwAlertView风格
 *  @param title      标题
 *  @param message    信息
 *  @param delegate   代理
 *  @param cancelText 取消按钮title
 *  @param otherText  其他按钮title
 *
 *  @return AwAlertView
 */
-(nullable instancetype)initWithStyle:(AwAlertViewStyle)awStyle title:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id)delegate cancelTitle:(nullable NSString *)cancelText otherTitle:(nullable NSString *)otherText;
/**
 *  不同样式的AwAlertView初始化方法
 *
 *  @param awStyle    AwAlertView风格
 *  @param title      标题
 *  @param message    信息
 *  @param delegate   代理
 *  @param customview 自定义视图，可以是UIView,UITableView,...
 *  @param cancelText 取消按钮title
 *  @param otherText  其他按钮title
 *
 *  @return AwAlertView
 */
-(nullable instancetype)initWithStyle:(AwAlertViewStyle)awStyle title:(nullable NSString *)title message:(nullable NSString *)message delegate:(nullable id)delegate customView:(nullable UIView *)customview cancelTitle:(nullable NSString *)cancelText otherTitle:(nullable NSString *)otherText;

#pragma mark - 不同需求的Show方法
/**
 *  清除当前显示的AwAlertView
 */
- (void)dismiss;
/**
 *  AlertView 展示方法
 */
-(void)show;
/**
 *  指定即将展示的View在父视图中的Y值,view显示位置居中
 *
 *  @param positionY 距离顶部的Y
 *  @param flag      标记是否动画
 */
-(void)showWithY:(CGFloat)positionY withAnimationFlag:(BOOL)flag;
/**
 *  指定即将展示的View的距离底部的偏移值,view显示位置居中,标记是否选择动画
 *
 *  @param offset 距离底部的偏移量
 *  @param flag   标记是否动画
 */
-(void)showWithBottomYOffset:(CGFloat)offset withAnimationFlag:(BOOL)flag;

/**
 *  指定在某个位置展示
 *
 *  @param position origin,frame坐标系中左顶点坐标
 */
-(void)showInPoint:(CGPoint)position;

/**
 *  指定在某个区域显示,Note:如果是自定义View，只支持约束和在layoutSubViews重写的布局，
 *  如果这个方面不是太懂的尽量不用这个方法
 *  @param rect 相对父视图坐标系的frame
 */
-(void)showInRect:(CGRect)rect;
/***************************************************************************/
/*!
 @property      dimBackground
 @abstract      是否显示背景渐变色,默认显示
 */
@property (nonatomic, assign) BOOL hideDimBackground;
/** 是否启用背景事件，默认不启用 */
@property (nonatomic, assign) BOOL isUseHidden;
/** 提供多个动画效果，默认AwAlertViewAniDefault */
@property (nonatomic, assign) AwAlertViewStyle animationStyle;

/** 是否需要放弃键盘响应,这个属性与isUserHidden一起使用 */
@property (nonatomic, assign) BOOL needGiveupTouch;

- (nullable instancetype)initWithContentView:(nonnull UIView *)contentView;
/**
 *  动态更新自定义View的Y值
 *
 *  @param positionY 动态调整自定义View的Y值
 *  @param duration  持续时间,动画时间,键盘弹起的时间是0.25秒
 */
- (void)awAlertViewAnimationWithPositionYValues:(CGFloat)positionY andDuration:(NSTimeInterval)duration;

@end
