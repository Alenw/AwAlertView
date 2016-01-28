//
//  AwAlertView.h
//  test
//
//  Created by soyoung on 16/1/22.
//  Copyright © 2016年 soyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AwAlertViewDefault=0,
    AwAlertViewStyle1,
    AwAlertViewStyle2,
    AwAlertViewStyle3
}AwAlertViewStyle;

@class AwAlertView;
@protocol AwAlertViewDelegate <NSObject>
@optional
- (void)alertView:(AwAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex; // before animation and hiding view
- (void)alertView:(AwAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;

- (void)didRotationToInterfaceOrientation:(BOOL)Landscape view:(UIView*)view alertView:(AwAlertView *)aletView;

@end

@interface AwTipView : UIView
/*!
 @property      showTime
 @abstract      展示的时间，可设置
 */
@property (nonatomic, assign) CGFloat showTime;

/*!
 @property      dimBackground
 @abstract      是否显示背景渐变色
 */
@property (nonatomic, assign) BOOL dimBackground;

/*!
 @method        initWithView:message:posY:
 @abstract      初始化方法
 @param         view  所在的view
 @param         message  展示内容
 @param         posY  离superView顶部的距离
 @result        BBTipView的对象
 */
- (id)initWithView:(UIView *)view message:(NSString *)message posY:(CGFloat)posY;


- (id)initWithView:(UIView *)view title:(NSString *)title message:(NSString *)message posY:(CGFloat)posY;

/*!
 @method        show
 @abstract      弹出
 */
- (void)show;

/*!
 @param         animation 消失时是否使用动画
 */
- (void)dismiss:(BOOL)animation;
@end


/**
 *  禁止使用［AwAlertView alloc］init]形式创建对象
 */
@interface AwAlertView : UIView
@property (nonatomic, assign) id<AwAlertViewDelegate> delegate;
@property (nonatomic, assign) AwAlertViewStyle awStyle;
/*!
 是否正在显示
 */
@property (nonatomic, readonly, getter=isVisible) BOOL visible;
/*!
 背景视图，覆盖全屏的，默认nil
 */
@property (nonatomic, strong) UIView *backgroundView;

/*****************************下面属性作用域**********************************/

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 标题字体颜色 */
@property (nonatomic, copy) UIColor *titleTextColor;

/** 信息 */
@property (nonatomic, copy) NSString *message;
/** 信息字体颜色 */
@property (nonatomic, copy) UIColor *messageTextColor;

/** 按钮颜色 */
@property (nonatomic, copy) UIColor *cancelTextColor;
/** 按钮图标 */
@property (nonatomic, strong) UIImage *cancelImage;
/** 按钮颜色 */
@property (nonatomic, copy) UIColor *otherTextColor;
/** 按钮图标 */
@property (nonatomic, strong) UIImage *otherImage;

/** 关闭按钮正常图片 */
@property (nonatomic, strong) UIImage *closeImage;
/** 关闭按钮高亮图片 */
@property (nonatomic, strong) UIImage *closeImage_hl;

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
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate customView:(UIView *)customview cancelTitle:(NSString *)cancelText otherTitle:(NSString *)otherText;
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
-(instancetype)initWithStyle:(AwAlertViewStyle)awStyle title:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelTitle:(NSString *)cancelText otherTitle:(NSString *)otherText;
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
-(instancetype)initWithStyle:(AwAlertViewStyle)awStyle title:(NSString *)title message:(NSString *)message delegate:(id)delegate customView:(UIView *)customview cancelTitle:(NSString *)cancelText otherTitle:(NSString *)otherText;


-(void)show;
/***************************************************************************/

/** 是否启用背景事件，默认不启用 */
@property (nonatomic, assign) BOOL isUseHidden;

- (instancetype)initWithContentView:(UIView *)contentView;
@end
