//
//  DynamicViewController.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "DynamicViewController.h"
#import "SYTableViewHeader.h"
#import "TestView.h"

@implementation DynamicViewController
- (void)viewDidLoad{
	[super viewDidLoad];
	self.automaticallyAdjustsScrollViewInsets = NO;
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = @"动态高度TableView";
	
	
	//动态高度
	CGRect tbvFrame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60);
	NSString *viewName = NSStringFromClass([TestView class]);
	SYTableView *tbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:viewName columnNumber:1 target:self action:@selector(setupData)];
	tbv.arrayDatas = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
	tbv.rowHeight = 40;
	tbv.cellHeightArrays = [NSArray arrayWithObjects:@"45",@"55",@"65", nil];
	[tbv reloadData];
	[self.view addSubview:tbv];
}
@end
