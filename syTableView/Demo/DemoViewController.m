//
//  DemoViewController.m
//  syJiugonggeTableView
//
//  Created by 世缘 on 15/2/8.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "DemoViewController.h"
#import "JJGTestViewController.h"
#import "RowViewController.h"

@implementation DemoViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"测试";
    
    CGFloat frameX = 100;
    CGFloat frameWidth = 180;
    CGFloat frameHeight = 30;
    
    CGRect btn1Frame = CGRectMake(frameX, 100, frameWidth, frameHeight);
    UIButton *btn1 = [self createButtonWithFrame:btn1Frame title:@"九宫格测试"];
    btn1.tag = 1;
    [self.view addSubview:btn1];
    
    CGRect btn2Frame = CGRectMake(frameX, 150, frameWidth, frameHeight);
    UIButton *btn2 = [self createButtonWithFrame:btn2Frame title:@"单行TableView测试"];
    btn2.tag = 2;
    [self.view addSubview:btn2];
}

-(UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title{
    UIButton *btn = [[[UIButton alloc]init]autorelease];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(JJGTest:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    return btn;
}

-(void) JJGTest:(UIButton *)btn{
    UIViewController *vc;
    if (btn.tag==1) {
        vc = [[[JJGTestViewController alloc]init]autorelease];
    }else{
        vc = [[[RowViewController alloc]init]autorelease];
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end
