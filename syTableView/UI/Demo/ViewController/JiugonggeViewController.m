//
//  JiugonggeViewController.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "JiugonggeViewController.h"
//引入
#import "SYTableViewHeader.h"

#import "JiugonggeView.h"
#import "JiugonggeModel.h"
#import "DemoDataManager.h"

@implementation JiugonggeViewController
- (void)viewDidLoad{
	[super viewDidLoad];
	self.title = @"九宫格TableView";
	self.view.backgroundColor = [UIColor whiteColor];
	self.automaticallyAdjustsScrollViewInsets = NO;
//	[self initWidthJiugonggeList];
	
	//自定义间距
	[self initWidthJiugonggeListTwo];
}

#pragma mark - 初始化默认间距为5的九宫格
- (void)initWidthJiugonggeList{
	CGRect tbvFrame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
	//获取自定义view的className
	NSString *rowViewClass = NSStringFromClass([JiugonggeView class]);
	//1.初始化tableView  columnNumber指定九宫格列数
	SYTableView *rowTbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:rowViewClass columnNumber:3 target:self action:@selector(jiugonggeSetupData:)];
	
	//初始方式也可以使用block,如下
//	SYTableView *rowTbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:rowViewClass columnNumber:3 setupData:^(SYTableViewEntity *ent) {
//		
//	}];
	
	//指定数据
	rowTbv.arrayDatas = [NSMutableArray arrayWithArray:[DemoDataManager getJiugonggeData]];
	//行高设置
	rowTbv.rowHeight = 100;
	[self.view addSubview:rowTbv];
}

#pragma mark 可以自定义间距
- (void)initWidthJiugonggeListTwo{
	CGRect tbvFrame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
	//获取自定义view的className
	NSString *rowViewClass = NSStringFromClass([JiugonggeView class]);
	//1.初始化tableView  columnNumber指定九宫格列数
	SYTableView *rowTbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:rowViewClass columnNumber:3 leftMargin:5 apartMargin:5 target:self action:@selector(jiugonggeSetupData:)];
	
	//初始方式也可以使用block
	
	//指定数据
	rowTbv.arrayDatas = [NSMutableArray arrayWithArray:[DemoDataManager getJiugonggeData]];
	//行高设置
	rowTbv.rowHeight = 100;
	[self.view addSubview:rowTbv];
}

- (void)jiugonggeSetupData:(SYTableViewEntity *)ent{
	JiugonggeView *rowView = (JiugonggeView *)ent.customView;//取出自定义view
	JiugonggeModel *model = ent.entity;//取出数据中的实体
	//赋值
	[rowView.btn_avatar setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
	rowView.lbl_title.text = model.title;
}
@end
