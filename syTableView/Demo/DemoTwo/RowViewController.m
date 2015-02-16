//
//  RowViewController.m
//  syJiugonggeTableView
//
//  Created by 世缘 on 15/2/8.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "RowViewController.h"
//1.导入头文件
#import "SYTableViewHeader.h"

#import "RowView.h"
#import "RowEntity.h"

@implementation RowViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"单行TableView测试";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //2.初始化tableView
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGRect tbVframe = CGRectMake(0, 20, width, height-50);
    NSArray *arrayDatas = [self initTestData];//获取假数据
    
    //3.获取自定义view的名称
    NSString *customViewName = NSStringFromClass([RowView class]);
    
    SYTableView *tbv = [[SYTableView alloc]initWithFrame:tbVframe data:arrayDatas customViewName:customViewName height:50];
    [self.view addSubview:tbv];
    
    //4.设置view的数据显示
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupCellData:) name:JiugonggeCellDataNotification object:nil];
}

/**
 *  5对view进行赋值
 *
 *  @param notification notification是一个SYJiugonggeEntity对象(包含自定义的view和自定义的实体)
 */
-(void)setupCellData:(NSNotification *)notification{
    //取出自定义view和自定义的实体
    SYTableViewEntity *obj = [notification object];
    RowView *rowView = (RowView *)obj.customView;
    RowEntity *rowEntity = obj.entity;
    
    [rowView.btn_avatar setImage:[UIImage imageNamed:rowEntity.string_icon] forState:UIControlStateNormal];
    rowView.lbl_title.text = rowEntity.string_title;
}

//1.初始化假数据
-(NSArray *) initTestData{
    NSMutableArray *results = [[[NSMutableArray alloc]init]autorelease];
    NSArray *arrayIcon = [NSArray arrayWithObjects:
                          @"personalcenter_tab_icon_selected",//用户中心
                          @"my_privilege_icon",//vip专区
                          @"my_wallet_icon",//我的钱包
                          @"my_notification_icon",//我的消息
                          @"my_laapp_icon",//我的订阅
                          @"my_bookmark_icon",//书签/历史
                          @"my_download_icon",//下载/离线
                          @"wallet_paysecurity",//安全检查
                          @"wallet_trade",//文件管理
                          @"pixel_search_share_friends",//图片管理
                          @"my_setting_icon",//设置
                          nil];
    
    NSArray *arrayTitle = [NSArray arrayWithObjects:
                          @"用户中心",
                          @"vip专区",
                          @"我的钱包",
                          @"我的消息",
                          @"我的订阅",
                          @"书签/历史",
                          @"下载/离线",
                          @"安全检查",
                          @"文件管理",
                          @"图片管理",
                          @"设置",
                          nil];
    
    for (int i =0; i<arrayIcon.count; i++) {
        RowEntity *entity = [[RowEntity alloc]init];
        entity.string_icon = arrayIcon[i];
        entity.string_title = arrayTitle[i];
        [results addObject:entity];
        [entity release];
    }
    
    return results;
}
@end
