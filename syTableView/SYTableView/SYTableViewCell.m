//
//  SYTableViewCell.m
//  SyUtils
//
//  Created by 世缘 on 15/8/17.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "SYTableViewCell.h"
#import "SYTableViewEntity.h"
#import <objc/message.h>
// objc_msgSend
#define msgSend(...) ((void (*)(void *, SEL, NSObject *))objc_msgSend)(__VA_ARGS__)
#define msgTarget(target) (__bridge void *)(target)

@implementation SYTableViewCell
@synthesize cellColumnNumber,cellDatas,leftMargin;

-(id)init{
	if (self = [super init]) {
	}
	return self;
}

#pragma mark 初始化cell
- (id)initWithReuseIdentifier:(NSString *) reuseIdentifier
			 customerViewName:(NSString *) viewName
			 cellColumnNumber:(NSInteger) columnNumber
				   leftMargin:(CGFloat) lMargin
				  apartMargin:(CGFloat) apartMargin
						width:(CGFloat) width
					   height:(CGFloat) height{
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	if(self){
		leftMargin = lMargin;
		self.cellColumnNumber = columnNumber;
		for (int i = 0; i<self.cellColumnNumber; i++) {
			CGFloat x;
			if(i==0){
				x=leftMargin;
			}else{
				x=(width*i)+(apartMargin*i)+leftMargin;
			}
			CGRect viewFrame = CGRectMake(x, 0, width, height);
			Class  cls =  NSClassFromString(viewName);
			UIView *view = [[cls alloc] initWithFrame:viewFrame];
			view.tag = i+kTagStart;
			[self.contentView addSubview:view];
		}
	}
	return self;
}

#pragma mark 计算
-(id)loadJiugonggeCellData:(NSIndexPath *)indexPath cellDatas:(NSArray *)datas{
	if (cellDatas == nil) {
		cellDatas = [[NSMutableArray alloc]init];
	}
	self.cellDatas = datas;
	NSInteger location = indexPath.row * cellColumnNumber;
	NSInteger length = cellColumnNumber;
	
	if (location + length >= self.cellDatas.count) {
		length = self.cellDatas.count - location;
	}
	NSRange range = NSMakeRange(location, length);
	NSArray *rowProducts = [self.cellDatas subarrayWithRange:range];
	[self setRowProducts:rowProducts indexPath:indexPath];
	self.backgroundColor = [UIColor clearColor];
	return self;
}

#pragma mark 设置cell数据
-(void) setRowProducts:(NSArray *)products indexPath:(NSIndexPath *)indexPath{
	for (int i = 0; i<cellColumnNumber; i++) {
		int tag = i + kTagStart;
		UIView *view = (UIView *)[self viewWithTag:tag];
		if (i>products.count - 1) {
			view.hidden = YES;
		} else {
			view.hidden = NO;
			SYTableViewEntity *entity = [[SYTableViewEntity alloc]init];
			entity.customView = view;
			entity.entity = products[i];
			entity.indexPath=indexPath;
			if ([self.setupDataTaget respondsToSelector:self.setupDataAction]) {
				msgSend(msgTarget(self.setupDataTaget),self.setupDataAction,entity);
			}
			if (self.setupDataCallBack) {
				self.setupDataCallBack(entity);
			}
		}
	}
}

- (void)dealloc{
	self.cellDatas = nil;
}
@end
