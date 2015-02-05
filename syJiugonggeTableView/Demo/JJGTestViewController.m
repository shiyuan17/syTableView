//
//  JJGTestViewController.m
//  syJiugonggeTableView
//
//  Created by 世缘 on 15/2/5.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "JJGTestViewController.h"
#import "SYJiugonggeTableView.h"
#import "SYJiugonggeEntity.h"

#import "JJGTestView.h"
#import "JJGEntity.h"


@implementation JJGTestViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    //假数据
    NSMutableArray *arrayData = [[NSMutableArray alloc]init];
    for (int i=0; i<19; i++) {
        JJGEntity *entity = [[JJGEntity alloc]init];
        entity.title = [NSString stringWithFormat:@"测试%d",(i+1)];
        entity.icon = [NSString stringWithFormat:@"%d",(i+1)];
        [arrayData addObject:entity];
        [entity release];
    }
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGRect tbVframe = CGRectMake(0, 20, width, height-50);
    
    //获取自定义view的class名称
    NSString *customViewName =  NSStringFromClass([JJGTestView class]);
    
    //初始化tableView
    SYJiugonggeTableView *tbv = [[SYJiugonggeTableView alloc]initWithFrame:tbVframe data:arrayData customViewName:customViewName cellColumnNumber:3 apartMargin:10 width:100 height:100];
    [self.view addSubview:tbv];
    
    //设置view的数据显示
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupCellData:) name:JiugonggeCellDataNotification object:nil];
}

-(void)setupCellData:(NSNotification *)notification{
    SYJiugonggeEntity *jjgEntity = [notification object];
    JJGTestView *tv = (JJGTestView *)jjgEntity.customView;
    JJGEntity *entity = jjgEntity.entity;
    NSString *icon = [NSString stringWithFormat:@"%@.jpg",entity.icon];
    [tv.btn_avatar setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    tv.lbl_title.text = entity.title;
}
@end
