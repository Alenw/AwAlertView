//
//  ViewController.m
//  AwlenAlertViewExample
//
//  Created by soyoung on 16/1/25.
//  Copyright © 2016年 AlenW. All rights reserved.
//

#import "ViewController.h"
#import <AwAlertViewlib/AwAlertViewlib.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
/** 使用不同Style创建 */
- (IBAction)b1:(id)sender {
    AwAlertView *alert=[[AwAlertView alloc]initWithStyle:AwAlertViewStyle1 title:@"title" message:@"message" delegate:self cancelTitle:@"cancel" otherTitle:@"other"];
    alert.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alert.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
    [alert show];
}
/** 使用不同Style创建 */
- (IBAction)b2:(id)sender {
    AwAlertView *alert=[[AwAlertView alloc]initWithStyle:AwAlertViewStyle2 title:@"title" message:@"message" delegate:self cancelTitle:@"cancel" otherTitle:@"other"];
    [alert show];
    alert.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alert.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
}
/** 使用不同Style创建 */
- (IBAction)b3:(id)sender {
    AwAlertView *alert=[[AwAlertView alloc]initWithStyle:AwAlertViewStyle3 title:@"title" message:@"message" delegate:self cancelTitle:@"cancel" otherTitle:@"other"];
    [alert show];
    alert.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alert.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
}
/** 使用自定义View创建 */
- (IBAction)b4:(id)sender {
    UIImageView *imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a"]];
    AwAlertView *alertView=[[AwAlertView alloc]initWithTitle:@"title" message:@"这是一张美女图片这是一张美女图片这是一张美女图片这是一张美女图片这是一张美女图片" delegate:self customView:imageV cancelTitle:@"cancel" otherTitle:@"other"];
    [alertView show];
    alertView.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alertView.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
}
/** 使用自定义View创建 */
- (IBAction)b5:(id)sender {
    UIImageView *imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"b"]];
    AwAlertView *alertView=[[AwAlertView alloc]initWithTitle:@"title" message:@"这是一张风景图片这是一张风景图片这是一张风景图片这是一张风景图片这是一张风景图片" delegate:self customView:imageV cancelTitle:@"cancel" otherTitle:@"other"];
    [alertView show];
    alertView.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alertView.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
}
/** 使用自定义View创建 */
- (IBAction)b6:(id)sender {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor=[UIColor grayColor];
    UILabel *label=[[UILabel alloc]initWithFrame:view.bounds];
    label.numberOfLines=0;
    label.text=@"这是一个内置显示View,可以显示tableview，collectionView..and so on !";
    [view addSubview:label];
    AwAlertView *alertView=[[AwAlertView alloc]initWithTitle:@"title" message:@"message" delegate:nil customView:view cancelTitle:@"cancel" otherTitle:@"other"];
    [alertView show];
    alertView.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alertView.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
}
/** 使用alloc创建，不建议 */
- (IBAction)b7:(id)sender {
    AwAlertView *alert=[[AwAlertView alloc]init];
    //    alert.title=@"titlemessage";
    alert.titleTextColor=[UIColor redColor];
    alert.message=@"fixmessagefixmessagefixmessagefixmessagefixmessagefixmessagefixmessage";
    alert.messageTextColor=[UIColor blueColor];
    alert.cancelTextColor=[UIColor redColor];
    alert.otherTextColor=[UIColor blueColor];
    alert.cancelImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
    alert.otherImage=[UIImage imageNamed:@"homeIcon_20"];
    [alert show];
    alert.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alert.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
}
/** 使用initWithContentView创建 */
- (IBAction)b8:(id)sender {
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 300)];
    UIImageView *image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a"]];
    image.frame=view.frame;
    image.contentMode=UIViewContentModeScaleAspectFit;
    [view addSubview:image];
    AwAlertView *alertView=[[AwAlertView alloc]initWithContentView:view];
    alertView.isUseHidden=YES;
    [alertView show];
    alertView.closeImage=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close"];
    alertView.closeImage_hl=[UIImage imageNamed:@"AwAlertViewlib.bundle/btn_navigation_close_hl"];
}
- (IBAction)b9:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithView:self.view message:@"tipsView" posY:110];
    tipView.dimBackground=YES;
    [tipView show];
}
- (IBAction)b10:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithView:self.view title:@"title" message:@"message" posY:0];
    [tipView show];
}


-(void)alertView:(AwAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
}

@end
