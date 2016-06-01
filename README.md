### AwAlertView
This AlertView can do more things which you need !
<br/>
https://github.com/Alenw/AwAlertView。
<br/>
#####更多精彩内容，请查看demo！

###### 这是一个多功能显示的AlertView，可以显示基本信息，还可以显示图片，显示自定义View，样式多样！集成非常简单，类似系统的AlertView。<br>
###### 这个Framework还包含一个AwTipView，这个类功能是用来展示信息，类似于安卓的吐司功能，不过这个功能还不是很完善，我会继续提交新的版本。<br>
<hr>
<ul>
<li>增加三个初始化方法</li>
 <li>增加show 和hide 方法</li>
 <li>增加stlye,区分不同使用情况</li>
</ul>
<br>

<br/>
![](https://github.com/Alenw/AwAlertView/blob/master/wt3.gif)
<br/>

###### show And Hide 方法
	    /*!
             @method        show
             @abstract      弹出
             */
            - (void)showAnimated:(BOOL)animated;

            /*!
             @param         animation 消失时是否使用动画
             */
            - (void)hideAnimated:(BOOL)animated;

###### show 带block方法
/**
 *  默认执行完block中的内容会移除AwTipView
 *
 *  @param animated   是否启用动画
 *  @param block      显示AwTipView时候执行的block
 *  @param completion 完成时候执行的block
 */
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(nullable dispatch_block_t)block completionBlock:(nullable void (^)())completion ;

<hr>

###### AwAlertView 新增三种show的方法，showInPoint、showWithY、showInRect，功能如名字一样，  功能如下图演示GIF，如何使用请下载查看example Demo! <br><br>

<br/>

#####新增加方法，用于解决弹出TextField键盘遮挡问题

       /**
        *  动态更新自定义View的Y值
        *
        *  @param positionY 动态调整自定义View的Y值
        *  @param duration  持续时间,动画时间,键盘弹起的时间是0.25秒
        */
        - (void)awAlertViewAnimationWithPositionYValues:(CGFloat)positionY andDuration:(NSTimeInterval)duration;

<br/>

#####新增两个属性
       
 	/** 是否需要放弃键盘响应,这个属性与isUserHidden一起使用 */
        @property (nonatomic, assign) BOOL needGiveupTouch;

        /*!
         *   @property      dimBackground
 	 *   @abstract      是否显示背景渐变色,默认显示
	 */
	 @property (nonatomic, assign) BOOL hideDimBackground;
<br/>

#####pragma mark - 不同需求的Show方法

         /**
	  *  AlertView 展示方法
	  */
	 -(void)show;

	 /**
 	  *  指定即将展示的View的Y值,view显示位置居中
	  *
 	  *  @param positionY 相对父视图坐标系的Y
 	  */
	 -(void)showWithY:(CGFloat)positionY;

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

<br/>
![](https://github.com/Alenw/AwAlertView/blob/master/wt2.gif)
<br/>

![](https://github.com/Alenw/AwAlertView/blob/master/share.png)
<br/>

###Contact
Alen Wang
<br/>
lanskyxti@163.com

