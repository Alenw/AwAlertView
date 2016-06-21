//
//  WebViewController.m
//  AwlenAlertViewExample
//
//  Created by yelin on 16/6/21.
//  Copyright © 2016年 AlenW. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIWebView *webview=[[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webview];
    
    NSURL *webUrl=[NSURL URLWithString:self.url];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:webUrl];
    [webview loadRequest:request];
}
@end
