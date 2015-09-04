//
//  RowViewController.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "RowViewController.h"
//引入
#import "SYTableViewHeader.h"

#import "RowView.h"
#import "RowViewModel.h"
#import "DemoDataManager.h"
@implementation RowViewController
- (void)viewDidLoad{
	[super viewDidLoad];
	self.automaticallyAdjustsScrollViewInsets = NO;
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = @"普通tableView";
	//普通单行tabelview使用方式
	
	//初始方式一
	[self initRowListView];
	
	//初始方式二block
//	[self initRowListViewWithBlock];
}

- (void)initRowListView{
	CGRect tbvFrame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
	//获取自定义view的className
	NSString *rowViewClass = NSStringFromClass([RowView class]);
	//1.初始化tableView
	SYTableView *rowTbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:rowViewClass target:self action:@selector(rowListDataSetup:)];
	//指定数据
	rowTbv.arrayDatas = [NSMutableArray arrayWithArray:[DemoDataManager getRowViewData]];
	rowTbv.rowHeight = 45;//指定行高
	[self.view addSubview:rowTbv];
}

//3.为tableView设置数据
- (void)rowListDataSetup:(SYTableViewEntity *)ent{
	RowView *rowView = (RowView *)ent.customView;//取出自定义view
	RowViewModel *model = ent.entity;//取出数据中的实体
	//赋值
	[rowView.btn_avatar setImage:[UIImage imageNamed:model.string_icon] forState:UIControlStateNormal];
	rowView.lbl_title.text = model.string_title;
}


- (void)initRowListViewWithBlock{
	CGRect tbvFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	//获取自定义view的className
	NSString *rowViewClass = NSStringFromClass([RowView class]);
	//1.初始化tableView
	SYTableView *rowTbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:rowViewClass setupData:^(SYTableViewEntity *ent) {
		//设置tableView数据
		RowView *rowView = (RowView *)ent.customView;//取出自定义view
		RowViewModel *model = ent.entity;//取出数据中的实体
		//赋值
		[rowView.btn_avatar setImage:[UIImage imageNamed:model.string_icon] forState:UIControlStateNormal];
		rowView.lbl_title.text = model.string_title;
	}];
	//指定数据
	rowTbv.arrayDatas = [NSMutableArray arrayWithArray:[DemoDataManager getRowViewData]];
	[self.view addSubview:rowTbv];
}
@end
