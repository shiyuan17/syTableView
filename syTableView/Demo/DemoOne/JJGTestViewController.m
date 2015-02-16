//
//  JJGTestViewController.m
//  syJiugonggeTableView
//
//  Created by 世缘 on 15/2/5.
//  Copyright (c) 2015年 sy. All rights reserved.
//

//1.导入头文件
#import "SYTableViewHeader.h"

#import "JJGTestView.h"
#import "JJGEntity.h"


@implementation JJGTestViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"九宫格测试";
    //2.添加tableView假数据
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
    
    //3.获取自定义view的class名称
    NSString *customViewName =  NSStringFromClass([JJGTestView class]);
    
    //4.初始化tableView
    SYTableView *tbv = [[SYTableView alloc]initWithFrame:tbVframe data:arrayData customViewName:customViewName cellColumnNumber:3 apartMargin:10 width:100 height:100];
    [self.view addSubview:tbv];
    
    //5.设置view的数据显示
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupCellData:) name:JiugonggeCellDataNotification object:nil];
}


/**
 *  6对view进行赋值
 *
 *  @param notification notification是一个SYJiugonggeEntity对象(包含自定义的view和自定义的实体)
 */
-(void)setupCellData:(NSNotification *)notification{
    //取出自定义view和自定义的实体
    SYTableViewEntity *jjgEntity = [notification object];
    JJGTestView *tv = (JJGTestView *)jjgEntity.customView;
    JJGEntity *entity = jjgEntity.entity;
    
    //对view进行赋值
    NSString *icon = [NSString stringWithFormat:@"%@.jpg",entity.icon];
    [tv.btn_avatar setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    tv.lbl_title.text = entity.title;
}
@end
