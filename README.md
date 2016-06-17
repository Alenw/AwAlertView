### AwAlertView
This AlertView can do more things which you need !
<br/>
https://github.com/Alenw/AwAlertView。
<br/>
#####更多精彩内容，请查看demo！

###### SomeQusetions in Framework !
1.如果调用Framework中的方法出现unrecognized selector sent to instance xxxx，请按照下面解决方法；
If this is part of a static library, you need to add -all_load to the Other Linker Flags build setting for the app linking against the library.
2.如果上传APP时出现 XCode 7上传遇到ERROR ITMS-90535 Unexpected CFBundleExecutable Key. 的解决办法
找到对应的bundle，删除info.plist里面的Executable file对应的一整行，包括值。


####   AwTipView介绍
###### 这个Framework还包含一个AwTipView，这个类功能是用来展示信息，类似于安卓的吐司功能，我会继续提交新的版本完善。<br>
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

<br/>

<br>

###### show 带block方法


/**
 *  默认执行完block中的内容会移除AwTipView
 *
 *  @param animated   是否启用动画
 *  @param block      显示AwTipView时候执行的block
 *  @param completion 完成时候执行的block
 */

- (void)showAnimated:(BOOL)animated whileExecutingBlock:(nullable dispatch_block_t)block completionBlock:(nullable void (^)())completion ;

<br/>



##### 类方法，简化使用


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

<br/>
<hr>
<br>
<br>

##### AwAlertView介绍
###### 这是一个多功能显示的AlertView，可以显示基本信息，还可以显示图片，显示自定义View，样式多样！集成非常简单，类似系统的AlertView。<br>

<hr>
<ul>
<li>新版本修复了自定义View带UITableView 时cell点击事件被拦截BUG，当自定义view需要响应父视图事件时可以重写touch：begin方法 详见Demo b10 </li>
<li>新增NSNotification字段 awAlertViewDismiss 用于移除 AwAlertView,详见Demo b10对应的自定义View </li>
<li>优化show方法名称，弃用了一些属性，详见AwAlertView.h</li>
<li>高级功能从b8 开始，演示自定义View，AwAlertView的contentView 响应键盘上移事件，介绍show方法使用等 </li>
</ul></ul>
<br/>

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
	 -(void)showAnimated:(BOOL)animated;

	 /**
 	  *  指定即将展示的View的Y值,view显示位置居中
	  *
 	  *  @param positionY 相对父视图坐标系的Y
 	  */
	 -(void)showAnimated:(BOOL)animated withPositionY:(CGFloat)posY;

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

<br/>
![](https://github.com/Alenw/AwAlertView/blob/master/wt2.gif)
<br/>

![](https://github.com/Alenw/AwAlertView/blob/master/share.png)
<br/>

###Contact
Alen Wang
<br/>
lanskyxti@163.com

