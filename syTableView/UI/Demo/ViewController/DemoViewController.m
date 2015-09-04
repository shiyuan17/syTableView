//
//  DemoViewController.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "DemoViewController.h"
#import "SYTableViewHeader.h"
#import "RowViewController.h"
#import "JiugonggeViewController.h"
#import "SectionViewController.h"
#import "DynamicViewController.h"

@implementation DemoViewController
- (void)viewDidLoad{
	[super viewDidLoad];
	self.title = @"快速创建TableView";
	self.view.backgroundColor = [UIColor whiteColor];
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	NSMutableArray *arrays = [[NSMutableArray alloc]initWithObjects:@"普通单行tableView",@"九宫格",@"section",@"动态高度", nil];
	NSString *customerName = NSStringFromClass([UITableViewCell class]);
	CGRect tbvFrame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
	//初始化
	SYTableView *tbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:customerName setupData:^(SYTableViewEntity *ent) {
		UITableViewCell *cell = (UITableViewCell *)ent.customView;
		cell.userInteractionEnabled = NO;
		cell.textLabel.text = arrays[ent.indexPath.row];
	}];
	//设置数据来源
	tbv.arrayDatas = arrays;
	
	//设置选中事件 block设置方式
	[tbv setSelectBlock:^(NSIndexPath *indexPath){
		NSLog(@"block click");
		switch (indexPath.row) {
			case 0:
			{
				RowViewController *vc = [[RowViewController alloc]init];
				[self.navigationController pushViewController:vc animated:YES];
				 break;
			}
			case 1:
			{
				JiugonggeViewController *vc = [[JiugonggeViewController alloc]init];
				[self.navigationController pushViewController:vc animated:YES];
				break;
			}
			case 2:
			{
				SectionViewController *vc = [[SectionViewController alloc]init];
				[self.navigationController pushViewController:vc animated:YES];
				break;
			}
			case 3:
			{
				DynamicViewController *vc = [[DynamicViewController alloc]init];
				[self.navigationController pushViewController:vc animated:YES];
				break;
			}
			default:
				break;
		}
	}];
	
	//设置选中事件 普通方法方式
	tbv.target = self;
	tbv.selectedMethod = @selector(tableViewSelected:);
	[self.view addSubview:tbv];
}

- (void)tableViewSelected:(NSIndexPath *)indexpath{
	NSLog(@"click");
}
@end
