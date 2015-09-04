//
//  DemoDataManager.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "DemoDataManager.h"
#import "RowViewModel.h"
#import "JiugonggeModel.h"

@implementation DemoDataManager
+ (NSArray *)getRowViewData{
	NSMutableArray *results = [NSMutableArray array];
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
		RowViewModel *entity = [[RowViewModel alloc]init];
		entity.string_icon = arrayIcon[i];
		entity.string_title = arrayTitle[i];
		[results addObject:entity];
	}
	return results;
}

+ (NSArray *)getJiugonggeData{
	NSMutableArray *arrayData = [[NSMutableArray alloc]init];
	for (int i=0; i<19; i++) {
		JiugonggeModel *entity = [[JiugonggeModel alloc]init];
		entity.title = [NSString stringWithFormat:@"测试%d",(i+1)];
		entity.icon = [NSString stringWithFormat:@"%d",(i+1)];
		[arrayData addObject:entity];
	}
	return arrayData;
}
@end
