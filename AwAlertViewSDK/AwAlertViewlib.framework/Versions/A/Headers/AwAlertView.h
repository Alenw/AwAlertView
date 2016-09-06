//
//  AwAlertView.h
//  AwAlertViewlib
//
//  Created by yelin on 16/5/23.
//  Copyright © 2016年 AlenW. All rights reserved.
// 2016-09-06

#import <UIKit/UIKit.h>

#define AwDebug 1
/** AwTipView 显示样式 */
typedef enum {
    AwTipViewStyleNone=0,//不显示图片
    AwTipViewStyleIndicatorMid,//显示进度指示器到中间
    AwTipViewStyleIndicatorLeft,//显示进度指示器到左边
    AwTipViewStyleDeterminate,
    AwTipViewStyleAnnularDeterminate,
    
    AwTipViewStyleDeterminateHorizontalBar,
}AwTipViewShowStyle;

typedef void (^AwTipViewCompletionBlock)();

NS_ASSUME_NONNULL_BEGIN
/**
 *  这是一个绘制View背景色的方法
 *
 *  @param context     context
 *  @param rect        绘制的rect
 *  @param orientation 绘制三角形方向 orientation 0-->上 1-->下 2-->左 3-->右
 *  @param offset      三角形偏移量
 *  @param margin      三角形高度 一般使用15;
 *  @param color       绘制的颜色
 *  @param corner      绘制的圆角大小，一般是5;
 *  @param special     是否绘制带三角形指向
 */
 extern void addBackgroundTipColor(CGContextRef context, CGRect rect,int orientation,float offset,float margin,UIColor *color,float corner,BOOL special);
NS_ASSUME_NONNULL_END

@class AwBgView;
@interface AwTipView : UIView
/**
 *  类方法，显示message到指定View 的height－120的位置,默认显示1.5秒
 *  可以使用posY字段去修改这个位置,showTime 去改变显示时间
 *  @param message 将要显示到message
 *  @param view    View
 */
+(nullable AwTipView *)showToast:(nullable NSString *)message toView:(nullable UIView *)view;
/**
 *  类方法，显示message到指定View,不会自动消失,必须调用 hideForView:Animated:方法
 *  可以运用在HTTP加载时，加载成功手动隐藏
 *  @param message 将要显示到message
 *  @param view    View
 */
+(nullable AwTipView *)showMessage:(nullable NSString *)message toView:(nullable UIView *)view;
/**
 *  类方法,显示带图片的AwTipView 会自动隐藏，显示时间随success文字长度而改变(1个字符0.2s)
 *  可以使用showtime字段修改显示时长
 *  @param success success 信息
 *  @param view    View
 */
+(nullable AwTipView *)showSuccess:(nullable NSString *)success toView:(nullable UIView *)view;
/**
 *  类方法,显示带图片的AwTipView 会自动隐藏，显示时间随success文字长度而改变(1个字符0.2s)
 *  可以使用showtime字段修改显示时长
 *  @param success error 信息
 *  @param view    View
 */
+(nullable AwTipView *)showError:(nullable NSString *)error toView:(nullable UIView *)view;
/**
 *  显示icon，message到AwTipView中 会自动隐藏，显示时间随message文字长度而改变(1个字符0.2s)
 *  可以使用showtime字段修改显示时长
 *  @param iconName iconName，例如：AwAlertViewlib.bundle/success
 *  @param message  message
 *  @param view     view
 *
 *  @return AwTipView
 */
+(nullable AwTipView *)showIcon:(nullable NSString *)iconName message:(nullable NSString *)message toView:(nullable UIView *)view;
/**
 *  类方法，在View中移除AwTipView
 *
 *  @param view     view
 *  @param animated 是否动画
 */
+(void)hideForView:(nullable UIView *)view Animated:(BOOL)animated;

/*!
 * 仅对除进度指示器之外的style有效,如:AwTipViewStyleNone,AwTipViewStyleIndicatorMid,AwTipViewStyleIndicatorLeft
 @property      showTime
 @abstract      展示的时间，可设置
 */
@property (nonatomic, assign) CGFloat showTime;
/** 显示的位置 */
@property (nonatomic, assign) CGFloat posY;

/*!
 @property      dimBackground
 @abstract      是否显示背景渐变色
 */
@property (nonatomic, assign) BOOL dimBackground;

/** 默认背景色是0.8 black ,0.8white 0.8alph */
@property (nonatomic, strong,nullable) AwBgView *contentView;

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
 @result        AwTipView的对象
 */
- (nullable instancetype)initWithView:(nullable UIView *)view message:(nullable NSString *)message posY:(CGFloat)posY;


- (nullable instancetype)initWithView:(nullable UIView *)view title:(nullable NSString *)title message:(nullable NSString *)message posY:(CGFloat)posY;

- (nullable instancetype)initWithTipStyle:(AwTipViewShowStyle)style inView:(nullable UIView *)view title:(nullable NSString *)title message:(nullable NSString *)message posY:(CGFloat)posY;

- (nullable instancetype)initWithTipStyle:(AwTipViewShowStyle)style inView:(nullable UIView *)view icon:(nullable NSString *)iconName message:(nullable NSString *)message posY:(CGFloat)posY;
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

/** AwAlertView默认4种样式,其他样式请自定义 */
typedef enum {
    AwAlertViewDefault=0,
    AwAlertViewStyle1,
    AwAlertViewStyle2,
    AwAlertViewStyle3
}AwAlertViewStyle;

/** 弹出动画样式 ==> animationStyle */
typedef enum {
    AwAlertViewAniNone=0,//无动画
    AwAlertViewAniMin,//小幅度回弹
    AwAlertViewAniMax,//大幅度回弹
    AwAlertViewAniDown,//从上往下
    AwAlertViewAniUp//从下往上
}AwAlertViewAnimationStyle;
/** 消失动画样式 ==> dismissAnimation */
typedef enum {
    AwDismissNone=0,//无动画
    AwDismissDown,//往小消失
    AwDismissUp,//往上消失
    AwDismissOut//放大消失
}AwDismissAnimation;

@class AwAlertView;
@protocol AwAlertViewDelegate <NSObject>
@optional
/** 按钮点击事件代理方法 */
// before animation and hiding view
- (void)awAlertView:(nonnull AwAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex;

- (void)awAlertView:(nonnull AwAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
/** 暂未开放 */
- (void)didRotationToInterfaceOrientation:(BOOL)Landscape view:(nonnull UIView *)view alertView:(nonnull AwAlertView *)aletView;

@end

/**
 *  禁止使用［AwAlertView alloc］init]形式创建对象
 *  新增NSNotification awAlertViewDismiss 用于移除 AwAlertView,详见Demo b10
 */
@interface AwAlertView : UIView
@property (nonatomic, weak) id<AwAlertViewDelegate> delegate;

@property (nonatomic, assign) AwAlertViewStyle awStyle;

/** 提供多个动画效果，默认AwAlertViewAniDefault */
@property (nonatomic, assign) AwAlertViewAnimationStyle animationStyle;

/** 提供多个移除动画，默认AwDismissDefault */
@property (nonatomic, assign) AwDismissAnimation dismissAnimation;
/** block,注意:只响应一次 */
@property (nonatomic, copy,nullable) AwTipViewCompletionBlock clickBlock;

@property (nonatomic, copy,nullable) AwTipViewCompletionBlock dismissBlock;

/*!
 是否正在显示
 */
@property (nonatomic, readonly, getter=isVisible) BOOL visible;
/*!
 背景视图，覆盖全屏的，默认nil
 */
@property (nonatomic, strong,nullable) UIView *backgroundView;

/*!
 * 在contentView左上角加showTime时间
 @property      showTime
 @abstract      展示的时间，可设置
 */
@property (nonatomic, assign) unsigned int showTime;

/*****************************下面属性作用域**********************************/

/** 标题 */
@property (nonatomic, copy,nullable) NSString *title;
/** 标题字体颜色 */
@property (nonatomic, copy,nullable) UIColor *titleTextColor;

/** 信息 */
@property (nonatomic, copy,nullable) NSString *message;
/** 信息字体颜色 */
@property (nonatomic, copy,nullable) UIColor *messageTextColor;
/** 取消按钮 */
@property (nonatomic, strong,nullable) UIButton *cancelBtn;
/** 确定按钮 */
@property (nonatomic, strong,nullable) UIButton *otherBtn;
/** 关闭按钮 */
@property (nonatomic, strong,nullable) UIButton *closeBtn;


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
 *  显示AwAlertView
 *
 *  @param animated 是否加载动画
 */
- (void)showAnimated:(BOOL)animated;
/**
 *  指定即将展示的View在父视图中的Y值,view显示位置居中
 *
 *  @param positionY 距离顶部的Y
 *  @param flag      标记是否动画
 */
-(void)showAnimated:(BOOL)animated withPositionY:(CGFloat)posY;
/**
 *  指定即将展示的View的距离底部的偏移值,view显示位置居中,标记是否选择动画
 *
 *  @param offset 距离底部的偏移量
 *  @param flag   标记是否动画
 */
-(void)showAnimated:(BOOL)animated WithBottomYOffset:(CGFloat)offset;

/**
 *  指定在某个位置展示
 *
 *  @param position origin,frame坐标系中左顶点坐标
 */
-(void)showAnimated:(BOOL)animated inPoint:(CGPoint)point;

/**
 *  指定在某个区域显示,Note:如果是自定义View，只支持约束和在layoutSubViews重写的布局，
 *  如果这个方面不是太懂的尽量不用这个方法
 *  @param rect 相对父视图坐标系的frame
 */
-(void)showAnimated:(BOOL)animated inRect:(CGRect)rect;
/**
 *  移除AwAlertView
 *  @param animated 是否加载动画
 */
- (void)dismissAnimated:(BOOL)animated;

/**
 *  延迟隐藏AwAlertView
 *
 *  @param animated 是否动画
 *  @param delay    延迟时间
 */
- (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

/***************************************************************************/
/*!
 @property      dimBackground
 @abstract      是否显示背景渐变色,默认显示
 */
@property (nonatomic, assign) BOOL hideDimBackground;
/** 是否启用背景事件，默认不启用 */
@property (nonatomic, assign) BOOL isUseHidden;

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

@interface AwAlertView (Deprecated)

/** 按钮颜色 */
@property (nonatomic, strong,nullable) UIColor *cancelTextColor __attribute__((deprecated("Use cancelBtn to set attributes.")));
/** 按钮图标 */
@property (nonatomic, strong,nullable) UIImage *cancelImage __attribute__((deprecated("Use cancelBtn to set attributes.")));
/** 按钮颜色 */
@property (nonatomic, strong,nullable) UIColor *otherTextColor __attribute__((deprecated("Use otherBtn to set attributes.")));
/** 按钮图标 */
@property (nonatomic, strong,nullable) UIImage *otherImage __attribute__((deprecated("Use otherBtn to set attributes.")));

/** 关闭按钮正常图片 */
@property (nonatomic, strong,nullable) UIImage *closeImage __attribute__((deprecated("Use closeBtn to set attributes.")));
/** 关闭按钮高亮图片 */
@property (nonatomic, strong,nullable) UIImage *closeImage_hl __attribute__((deprecated("Use closeBtn to set attributes.")));

@end

@interface AwBgView : UIView
/** 方向 */
@property (nonatomic, assign) int orientation;
/** 偏移量 */
@property (nonatomic, assign) float offset;
/** 三角形H 高度 */
@property (nonatomic, assign) float margin;
/** 0直角，一般5左右 */
@property (nonatomic, assign) float corner;
/** 标识是否带三角形指向 */
@property (nonatomic, assign) BOOL special;
/** 背景色 */
@property (nonatomic, copy,nullable) UIColor *color;

@end
