//
//  SectionViewController.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "SectionViewController.h"
//引入
#import "SYTableViewHeader.h"
#import "TestView.h"
@implementation SectionViewController
- (void)viewDidLoad{
	[super viewDidLoad];
	self.automaticallyAdjustsScrollViewInsets = NO;
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = @"section设置";
	
	CGRect tbvFrame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
	NSString *viewName = NSStringFromClass([TestView class]);
	
	//初始化数据
	NSMutableArray *array = [[NSMutableArray alloc]init];
	for (int i=0; i<10; i++) {
		//SYSectionEntity 为载体 obj为sectionHeader的对应数据
		//rowArray为section下面的行数据
		SYSectionEntity *ent = [[SYSectionEntity alloc]init];
		ent.obj = nil;
		for (int j=0; j<3; j++) {
			[ent.rowArray addObject:@""];
		}
		[array addObject:ent];
	}
	
	SYTableView *tbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:viewName setupData:^(SYTableViewEntity *entity) {
	}];
	tbv.isSectionStickyHeader = NO;//section头部是否冻结
	tbv.rowHeight = 50;
	tbv.sectionHeaderHeight = 10;
	tbv.arrayDatas = [NSMutableArray arrayWithArray:array];
	[self.view addSubview:tbv];
}


@end
