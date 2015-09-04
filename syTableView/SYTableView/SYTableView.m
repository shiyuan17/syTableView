//
//  SYTableView.m
//  SyUtils
//
//  Created by 世缘 on 15/8/17.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "SYTableView.h"
#import "SYTableViewCell.h"
#import "SYSectionEntity.h"
#import <objc/message.h>
// objc_msgSend
#define msgSend(...) ((void (*)(void *, SEL, NSObject *))objc_msgSend)(__VA_ARGS__)
#define msgTarget(target) (__bridge void *)(target)
@implementation SYTableView
{
	BOOL isBlock;
	BOOL isSectionData;
}
@synthesize customerViewName,columnNumber;
@synthesize leftMargin,apartMargin,cellWidth;

- (id)init{
	if (self = [super init]) {
		_arrayDatas = [NSMutableArray array];
		_isSectionStickyHeader = YES;
	}
	return self;
}

#pragma mark - 单行tableview初始化 sel方法回调
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName target:(id)target action:(SEL)action{
	if (self = [super initWithFrame:frame]) {
		self.target = target;
		self.setupDataAction = action;
		self.separatorStyle = UITableViewCellSeparatorStyleNone;
		customerViewName = viewName;
		columnNumber = 1;
		leftMargin = 0;
		apartMargin = 0;
		self.delegate = self;
		self.dataSource = self;
		isBlock = NO;
	}
	return self;
}

#pragma mark - 单行tableview初始化 block回调
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName setupData:(void (^)(SYTableViewEntity *))setupData{
	if (self = [super initWithFrame:frame]) {
		customerViewName = viewName;
		self.separatorStyle = UITableViewCellSeparatorStyleNone;
		columnNumber = 1;
		leftMargin = 0;
		apartMargin = 0;
		self.delegate = self;
		self.dataSource = self;
		isBlock = YES;
		self.setupDataCallBack = setupData;
	}
	return self;
}

#pragma mark - 多列tableview初始化 sel回调
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column target:(id)target action:(SEL)action{
	self = [self initWithFrame:frame customerViewName:viewName columnNumber:column leftMargin:5 apartMargin:5 target:target action:action];
	return self;
}

#pragma mark - 多列tableview初始化 block回调
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column setupData:(void (^)(SYTableViewEntity *))setupData{
	self = [self initWithFrame:frame customerViewName:viewName columnNumber:column leftMargin:5 apartMargin:5 setupData:setupData];
	return self;
}

#pragma mark - 多列tableview初始化 sel回调  leftMargin margin
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column leftMargin:(CGFloat)lMargin apartMargin:(CGFloat)margin target:(id)target action:(SEL)action{
	if (self = [super initWithFrame:frame]) {
		self.target = target;
		self.setupDataAction = action;
		self.separatorStyle = UITableViewCellSeparatorStyleNone;
		
		customerViewName = viewName;
		columnNumber = column;
		leftMargin = lMargin;
		apartMargin = margin;
		CGFloat tWidth = (self.frame.size.width-(leftMargin*2))-((column-1)*apartMargin);
		cellWidth = tWidth/column;
		isBlock = NO;
		self.delegate = self;
		self.dataSource = self;
	}
	return self;
}

#pragma mark - 多列tableview初始化 block回调 leftMargin margin
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column leftMargin:(CGFloat)lMargin apartMargin:(CGFloat)margin setupData:(void (^)(SYTableViewEntity *))setupData{
	if (self = [super initWithFrame:frame]) {
		self.separatorStyle = UITableViewCellSeparatorStyleNone;
		cellWidth = self.frame.size.width/column;
		customerViewName = viewName;
		columnNumber = column;
		leftMargin = lMargin;
		apartMargin = margin;
		CGFloat tWidth = (self.frame.size.width-(leftMargin*2))-((column-1)*apartMargin);
		cellWidth = tWidth/column;
		isBlock = YES;
		self.delegate = self;
		self.dataSource = self;
		self.setupDataCallBack = setupData;
	}
	return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (_cellHeightArrays && _cellHeightArrays.count>0) {
		CGFloat height = [_cellHeightArrays[indexPath.row] floatValue];
		return height;
	}
	return self.rowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if (!self.arrayDatas) {
		return 0;
	}
	if (isSectionData && self.arrayDatas.count>0) {
		SYSectionEntity *entity = self.arrayDatas[section];
		return (entity.rowArray.count + columnNumber - 1) / columnNumber;
	}
	return (_arrayDatas.count + columnNumber - 1) / columnNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	SYTableViewCell *cell=nil;
	cell = [tableView dequeueReusableCellWithIdentifier:self.customerViewName];
	if(cell==nil){
		if (cellWidth==0) {
			cellWidth = self.frame.size.width;
		}
		cell = [[SYTableViewCell alloc]
				initWithReuseIdentifier:customerViewName
				customerViewName:customerViewName
				cellColumnNumber:columnNumber
				leftMargin      :leftMargin
				apartMargin     :apartMargin
				width           :cellWidth
				height          :self.rowHeight];
		cell.setupDataTaget = self.target;
		cell.setupDataAction = self.setupDataAction;
		cell.setupDataCallBack = self.setupDataCallBack;
	}
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	[cell loadJiugonggeCellData:indexPath cellDatas:self.arrayDatas];
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	if (isSectionData && self.arrayDatas.count>0) {
		return self.arrayDatas.count;
	}
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	if (isSectionData && self.arrayDatas.count>0) {
		return self.sectionHeaderHeight;
	}
	return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:_sectionHeaderView];
	return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

- (void)setArrayDatas:(NSMutableArray *)datas{
	if (datas && datas.count>0) {
		id className = datas[0];
		if ([className isKindOfClass:[SYSectionEntity class]]) {
			isSectionData = YES;
		}else{
			isSectionData = NO;
		}
	}
	_arrayDatas = datas;
}

#pragma mark - tableView选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if (_selectBlock) {
		self.selectBlock(indexPath);
	}
	if ([self.target respondsToSelector:self.selectedMethod]) {
		msgSend(msgTarget(self.target),self.selectedMethod,indexPath);
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 去掉UItableview headerview黏性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if (!_isSectionStickyHeader) {
		CGFloat sectionHeaderHeight = 40;
		if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
			scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
		}
		else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
			scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
		}
	}
	
}
@end
