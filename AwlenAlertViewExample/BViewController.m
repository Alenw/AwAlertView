//
//  BViewController.m
//  AwlenAlertViewExample
//
//  Created by yelin on 16/5/20.
//  Copyright © 2016年 AlenW. All rights reserved.
//

#import "BViewController.h"
#import <AwAlertViewlib/AwAlertViewlib.h>

@interface BViewController ()
@property (nonatomic, assign) BOOL canceled;
@property (weak, nonatomic) IBOutlet UIView *showView;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)b1:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithView:self.showView message:@"BViewController" posY:100];
    tipView.showTime=3;
    tipView.dimBackground=YES;
    [tipView showAnimated:YES];
}
- (IBAction)b2:(id)sender {
    AwTipView *tipView=[AwTipView showSuccess:@"正在加载..." toView:nil];
    tipView.showTime=6;
}
- (IBAction)b3:(id)sender {
    [AwTipView showError:@"正在加载..." toView:nil];
}
- (IBAction)b4:(id)sender {
    AwTipView *tipview=[AwTipView showIcon:@"icon_option_right" message:@"收藏成功" toView:nil];
    tipview.showTime=6;
}
- (IBAction)b5:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithTipStyle:AwTipViewStyleIndicatorMid inView:self.view title:nil message:@"正在加载...正在加载...正在加载...正在加载..." posY:100];
    [tipView showAnimated:YES];
    [tipView hideAnimated:YES afterDelay:3];
}
- (IBAction)b6:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithTipStyle:AwTipViewStyleIndicatorMid inView:self.view title:nil message:@"正在加载正在加载正在加载正在加载正在加载" posY:0];
    tipView.showTime=3;
    [tipView showAnimated:YES];
}
- (IBAction)b7:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithTipStyle:AwTipViewStyleIndicatorLeft inView:self.view title:nil message:@"正在加载正在加载正在加载正在加载正在加载" posY:100];
    tipView.showTime=3;
    [tipView showAnimated:YES];
}
- (IBAction)b8:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithTipStyle:AwTipViewStyleDeterminate inView:self.view title:nil message:@"正在加载..." posY:0];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgressWith:self.view];
        dispatch_async(dispatch_get_main_queue(), ^{
            [tipView hideAnimated:YES];
        });
    });
    tipView.dimBackground=YES;
    [tipView showAnimated:YES];
}
- (IBAction)b9:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithTipStyle:AwTipViewStyleAnnularDeterminate inView:self.view title:nil message:@"正在加载..." posY:0];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgressWith:self.view];
        dispatch_async(dispatch_get_main_queue(), ^{
            [tipView hideAnimated:YES];
        });
    });
    tipView.dimBackground=YES;
    [tipView showAnimated:YES];
}

- (IBAction)b10:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithTipStyle:AwTipViewStyleDeterminateHorizontalBar inView:self.showView title:nil message:@"正在加载..." posY:0];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgressWith:self.showView];
        dispatch_async(dispatch_get_main_queue(), ^{
            [tipView hideAnimated:YES];
        });
    });
    [tipView showAnimated:YES];
}
- (IBAction)b11:(id)sender {
    AwTipView *tipView=[[AwTipView alloc]initWithTipStyle:AwTipViewStyleDeterminateHorizontalBar inView:self.view title:nil message:@"正在加载..." posY:0];
    //    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
    //        // Do something useful in the background and update the HUD periodically.
    //        [self doSomeWorkWithProgress];
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [tipView hideAnimated:YES];
    //        });
    //    });
    //    [tipView showAnimated:YES];
    
    [tipView showAnimated:YES whileExecutingBlock:^{
        [self doSomeWorkWithProgressWith:self.view];
    } completionBlock:^{
        //        [tipView hideAnimated:YES];
        NSLog(@"执行完了");
    }];
}
- (IBAction)b12:(id)sender {
    AwTipView *tipview=[AwTipView showIcon:@"icon_option_right" message:@"收藏成功" toView:nil];
    tipview.showTime=20;
    tipview.contentView.color=[UIColor colorWithWhite:0.3 alpha:1.0];
    tipview.contentView.margin=15;
    tipview.contentView.orientation=0;
    tipview.contentView.offset=0;
    tipview.contentView.corner=5;
    //后期开放位置接口
    tipview.contentView.special=YES;
}
- (void)doSomeWorkWithProgressWith:(UIView *)view {
    self.canceled = NO;
    // This just increases the progress indicator in a loop.
    float progress = 0.0f;
    while (progress < 1.0f) {
        if (self.canceled) break;
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            // Instead we could have also passed a reference to the HUD
            // to the HUD to myProgressTask as a method parameter.
            AwTipView *tipView=[AwTipView HUDForView:view];
            //            NSLog(@"%@",@(progress));
            tipView.progress = progress;
        });
        usleep(50000);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
