//
//  ViewController.m
//  AwlenAlertViewExample
//
//  Created by soyoung on 16/1/25.
//  Copyright © 2016年 AlenW. All rights reserved.
//

#import "ViewController.h"
#import <AwAlertViewlib/AwAlertView.h>
#import "CountSelectView.h"

@interface ViewController ()<UITextFieldDelegate,CountSelectViewDelegate>
@property (nonatomic, weak) AwAlertView *alertView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationRech:) name:UIKeyboardDidShowNotification object:nil];
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:textView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
-(void)keyboardWillChangeFrame:(NSNotification *)notification{
    /**
     UIKeyboardFrameBeginUserInfoKey = NSRect: {{0, 568}, {320, 216}},
     UIKeyboardCenterEndUserInfoKey = NSPoint: {160, 460},
     UIKeyboardBoundsUserInfoKey = NSRect: {{0, 0}, {320, 216}},
     UIKeyboardFrameEndUserInfoKey = NSRect: {{0, 352}, {320, 216}},
     UIKeyboardAnimationDurationUserInfoKey = 0.25,
     UIKeyboardCenterBeginUserInfoKey = NSPoint: {160, 676},
     UIKeyboardAnimationCurveUserInfoKey = 7
     */
    //    if (self.switchingKeyboard) return;
//    NSLog(@"%@",notification.userInfo);
    //    NSDictionary *userInfo=notification.userInfo;
    //    double duration=[userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    //    CGRect keyboardF=[userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    //
    //    //改变工具条高度，以免被键盘盖住
    //    [UIView animateWithDuration:duration animations:^{
    //        self.toolbar.y=keyboardF.origin.y-self.toolbar.height;
    //    }];
}
-(void)notificationRech:(NSNotification *)noti{
    NSLog(@"notificationRech");
}
/** 使用不同Style创建 */
- (IBAction)b1:(id)sender {
    AwAlertView *alertView=[[AwAlertView alloc]initWithStyle:AwAlertViewStyle1 title:@"title" message:@"message" delegate:self cancelTitle:@"cancel" otherTitle:@"other"];
    alertView.animationStyle=AwAlertViewAniDefaul;
    [alertView showAnimated:YES];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"] forState:UIControlStateNormal];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateHighlighted];
    
}
/** 使用不同Style创建 */
- (IBAction)b2:(id)sender {
    AwAlertView *alertView=[[AwAlertView alloc]initWithStyle:AwAlertViewStyle2 title:@"title" message:@"message" delegate:self cancelTitle:@"cancel" otherTitle:@"other"];
    alertView.animationStyle=AwAlertViewAniStyle1;
    [alertView showAnimated:YES];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"] forState:UIControlStateNormal];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateHighlighted];
    
}
/** 使用不同Style创建 */
- (IBAction)b3:(id)sender {
    AwAlertView *alertView=[[AwAlertView alloc]initWithStyle:AwAlertViewStyle3 title:@"title" message:@"message" delegate:self cancelTitle:@"cancel" otherTitle:@"other"];
    alertView.animationStyle=AwAlertViewAniStyle2;
    [alertView showAnimated:YES];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"] forState:UIControlStateNormal];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateHighlighted];
    
}
/** 使用自定义View创建 */
- (IBAction)b4:(id)sender {
    UIImage *image=[UIImage imageNamed:@"a"];
    UIImageView *imageV=[[UIImageView alloc]initWithImage:image];
    AwAlertView *alertView=[[AwAlertView alloc]initWithTitle:@"title" message:@"这是一张美女图片这是一张美女图片这是一张美女图片这是一张美女图片这是一张美女图片" delegate:self customView:imageV cancelTitle:@"cancel" otherTitle:@"other"];
    [alertView showAnimated:YES];
    
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"] forState:UIControlStateNormal];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateHighlighted];
}
/** 使用自定义View创建 */
- (IBAction)b5:(id)sender {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor=[UIColor grayColor];
    UILabel *label=[[UILabel alloc]initWithFrame:view.bounds];
    label.numberOfLines=0;
    label.text=@"这是一个内置显示View,可以显示tableview，collectionView..and so on !";
    [view addSubview:label];
    AwAlertView *alertView=[[AwAlertView alloc]initWithTitle:@"title" message:@"message" delegate:nil customView:view cancelTitle:@"cancel" otherTitle:@"other"];
    [alertView showAnimated:YES];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"] forState:UIControlStateNormal];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateHighlighted];
}
/** 使用alloc创建，不建议 */
- (IBAction)b6:(id)sender {
    AwAlertView *alertView=[[AwAlertView alloc]init];
    //    alert.title=@"titlemessage";
    alertView.titleTextColor=[UIColor redColor];
    alertView.message=@"fixmessagefixmessagefixmessagefixmessagefixmessagefixmessagefixmessage";
    alertView.messageTextColor=[UIColor blueColor];
    [alertView.cancelBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [alertView.otherBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [alertView.cancelBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateNormal];
    [alertView.otherBtn setImage:[UIImage imageNamed:@"homeIcon_20"] forState:UIControlStateNormal];
    [alertView showAnimated:YES];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"] forState:UIControlStateNormal];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateHighlighted];
}

- (IBAction)b7:(id)sender {
    
}
/** 使用initWithContentView创建 */
#pragma AwAlertView 高级功能
- (IBAction)b8:(id)sender {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 300)];
    view.backgroundColor=[UIColor orangeColor];
    UIImageView *image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a"]];
    image.frame=view.bounds;
    image.contentMode=UIViewContentModeScaleAspectFit;
    [view addSubview:image];
    AwAlertView *alertView=[[AwAlertView alloc]initWithContentView:view];
    alertView.isUseHidden=YES;
    [alertView showAnimated:YES];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"] forState:UIControlStateNormal];
    [alertView.closeBtn setImage:[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"] forState:UIControlStateHighlighted];
    
    [alertView hideAnimated:YES afterDelay:3];
}

- (IBAction)b9:(id)sender {
    CountSelectView *view=[[[NSBundle mainBundle]loadNibNamed:@"CountSelectView" owner:self options:nil]lastObject];
    view.frame=CGRectMake(0, 0, 320, 300);
    view.delegate=self;
    view.dataArray=@[@"全体人员",@"办公室1",@"办公室2",@"办公室3",@"办公室4",@"办公室5"];
    AwAlertView *alertView=[[AwAlertView alloc]initWithContentView:view];
    alertView.isUseHidden=YES;
    [alertView showAnimated:YES withPositionY:(self.view.frame.size.height-300)/2+20];
    self.alertView=alertView;
}
- (IBAction)b10:(id)sender {
    CountSelectView *view=[[[NSBundle mainBundle]loadNibNamed:@"CountSelectView" owner:self options:nil]lastObject];
    view.frame=CGRectMake(0, 0, 320, 300);
    //新增NSNotification awAlertViewDismiss 用于移除 AwAlertView,详见Demo b10
    view.isUseTapHidden=YES;
    view.delegate=self;
    view.dataArray=@[@"全体人员",@"办公室1",@"办公室2",@"办公室3",@"办公室4",@"办公室5"];
    AwAlertView *alertView=[[AwAlertView alloc]initWithContentView:view];
    alertView.isUseHidden=YES;
    [alertView showAnimated:YES withPositionY:(self.view.frame.size.height-300)/2+20];
    
    self.alertView=alertView;
}
-(void)countSelectView:(CountSelectView *)selectView withAnswer:(NSArray *)answer{
    if (answer.count) {
        NSMutableString *string=[NSMutableString string];
        for (NSString *str in answer) {
            [string appendFormat:@"%@,",str];
        }
        [string deleteCharactersInRange:NSMakeRange(string.length-1, 1)];
        NSLog(@"代理方法:\n%@",string);
        
    }
    [self.alertView dismissAnimated:YES];
}
- (IBAction)b11:(id)sender {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-60, self.view.frame.size.width-60)];
    view.backgroundColor=[UIColor whiteColor];
    UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-80, 60)];
    textField.borderStyle=UITextBorderStyleRoundedRect;
    [view addSubview:textField];
    textField.delegate=self;
    textField.placeholder=@"请输入文字";
    AwAlertView *alertView=[[AwAlertView alloc]initWithContentView:view];
    self.alertView=alertView;
    
    [alertView showAnimated:YES];
    alertView.isUseHidden=YES;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing=rect=%@",NSStringFromCGRect(textField.frame));
    _alertView.needGiveupTouch=YES;
    [self.alertView awAlertViewAnimationWithPositionYValues:-100 andDuration:0.25];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
    [self.alertView awAlertViewAnimationWithPositionYValues:+100 andDuration:0.25];
}
- (IBAction)b12:(id)sender {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    view.backgroundColor=[UIColor orangeColor];
    
    AwAlertView *alert=[[AwAlertView alloc]initWithContentView:view];
    
    alert.isUseHidden=YES;
    
#warning 这里提供四种show方式
    //默认show在屏幕中间
    [alert showAnimated:YES];
    //    //show在指定的point
//        [alert showAnimated:YES inPoint:CGPointMake(20, 100)];
    
    //    //show在指定的rect
//        [alert showAnimated:YES inRect:CGRectMake(50, 50, 200, 200)];
}
//第5种show方式
- (IBAction)b13:(id)sender {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    view.backgroundColor=[UIColor orangeColor];
    
    AwAlertView *alert=[[AwAlertView alloc]initWithContentView:view];
    
    alert.isUseHidden=YES;
    [alert showAnimated:YES WithBottomYOffset:80];
}

-(void)alertView:(AwAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
}

@end
