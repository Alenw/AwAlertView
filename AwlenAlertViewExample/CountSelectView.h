//
//  CountSelectView.h
//  EasyLearn
//
//  Created by yelin on 16/5/17.
//  Copyright © 2016年 Alenw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountSelectView;
@protocol CountSelectViewDelegate <NSObject>

@optional
-(void)countSelectView:(CountSelectView *)selectView withAnswer:(NSArray *)answer;

@end

@interface CountSelectView : UIView
@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, weak) id<CountSelectViewDelegate> delegate;
/** 标记是否显示imageView,default No 显示 */
@property (nonatomic, assign) BOOL isHiddenImageV;
/** 点击自身无子控件时是否触发传递AwAlertView事件 */
@property (nonatomic, assign) BOOL isUseTapHidden;
@end
