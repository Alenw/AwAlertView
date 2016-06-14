//
//  CountSelectView.m
//  EasyLearn
//
//  Created by yelin on 16/5/17.
//  Copyright © 2016年 Alenw. All rights reserved.
//

#import "CountSelectView.h"
#import <AwAlertViewlib/AwAlertView.h>

@interface CountSelectView ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (nonatomic, copy) NSMutableArray *selectArray;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UIImageView *selectAllImage;
@property (weak, nonatomic) IBOutlet UIButton *selectAllBtn;
@end

@implementation CountSelectView
-(NSMutableArray *)selectArray{
    if (!_selectArray) {
        _selectArray=[NSMutableArray array];
    }
    return _selectArray;
}

//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    self=[super initWithCoder:aDecoder];
//    if (self) {
//        [self.tableView registerNib:[UINib nibWithNibName:@"PopTableViewCell" bundle:nil] forCellReuseIdentifier:@"PopTableViewCell"];
//        self.tableView.delegate=self;
//        self.tableView.dataSource=self;
//    }
//    return self;
//}
-(void)awakeFromNib{
//    [self.tableView registerNib:[UINib nibWithNibName:@"PopTableViewCell" bundle:nil] forCellReuseIdentifier:@"PopTableViewCell"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.layer.cornerRadius=5;
    

}
-(void)setIsHiddenImageV:(BOOL)isHiddenImageV{
    _isHiddenImageV=isHiddenImageV;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {

    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *celltips=@"PopTableViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:celltips];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celltips];
    }
    cell.userInteractionEnabled=YES;
    if(!self.isHiddenImageV){
        if ([self.selectArray containsObject:self.dataArray[indexPath.row]]) {
            cell.imageView.image=[UIImage imageNamed:@"btn_tick_s"];
        }else{
            cell.imageView.image=[UIImage imageNamed:@"btn_tick"];
        }
    }
    cell.textLabel.text=self.dataArray[indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"didSelectRowAtIndexPath:(NSIndexPath *)indexPath");

    NSString *string=self.dataArray[indexPath.row];
    if (self.isHiddenImageV) {
        if ([self.delegate respondsToSelector:@selector(countSelectView:withAnswer:)]) {
            [self.delegate countSelectView:self withAnswer:@[string]];
        }
    }else{
        
        if ([self.selectArray containsObject:string]) {
            [self.selectArray removeObject:string];
        }else{
            [self.selectArray addObject:string];
            
        }
        if (self.selectArray.count==self.dataArray.count) {
            self.selectAllBtn.selected=YES;
            self.selectAllImage.image=[UIImage imageNamed:@"btn_tick_s"];
        }else{
            self.selectAllBtn.selected=NO;
            self.selectAllImage.image=[UIImage imageNamed:@"btn_tick"];
        }
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (IBAction)sureBtnAction:(UIButton *)sender {
     NSLog(@"sureBtnAction");
    
    if ([self.delegate respondsToSelector:@selector(countSelectView:withAnswer:)]) {
        [self.delegate countSelectView:self withAnswer:self.selectArray];
    }
}
- (IBAction)selectedAll:(UIButton *)sender {
     NSLog(@"selectedAll");

    sender.selected=!sender.selected;
    if (sender.selected) {
        self.selectAllImage.image=[UIImage imageNamed:@"btn_tick_s"];
        [self.selectArray removeAllObjects];
        [self.selectArray addObjectsFromArray:self.dataArray];
    }else{
        self.selectAllImage.image=[UIImage imageNamed:@"btn_tick"];
        [self.selectArray removeAllObjects];
    }
    [self.tableView reloadData];
}

- (IBAction)cancelAction:(id)sender {
    NSLog(@"cancelAction");
#pragma mark - 方法一
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"awAlertViewDismiss" object:nil];
    
#pragma mark - 方法二
    [(AwAlertView *)self.superview dismissAnimated:YES];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
    if (self.isUseTapHidden) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"awAlertViewDismiss" object:nil];
    }
}
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *view=[super hitTest:point withEvent:event];
//    NSLog(@"%@",view);
//    return view;
//}
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    if ([self pointInside:point withEvent:event]) {
//        return self;
//    }
//    return nil;
//}

@end
