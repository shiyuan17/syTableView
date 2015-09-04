//
//  SYTableViewCell.h
//  SyUtils
//
//  Created by 世缘 on 15/8/17.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTagStart 1000
@class SYTableViewEntity;

@interface SYTableViewCell : UITableViewCell
@property (nonatomic,assign) CGFloat leftMargin;
@property (nonatomic,strong) NSArray *cellDatas;
@property (nonatomic,assign) NSInteger cellColumnNumber;

@property (weak, nonatomic) id setupDataTaget;
@property (assign, nonatomic) SEL setupDataAction;
@property (nonatomic, copy) void (^setupDataCallBack)(SYTableViewEntity *);

- (id)initWithReuseIdentifier:(NSString *) reuseIdentifier
			 customerViewName:(NSString *) viewName
			 cellColumnNumber:(NSInteger)  columnNumber
				   leftMargin:(CGFloat)    leftMargin
				  apartMargin:(CGFloat)    apartMargin
						width:(CGFloat)    width
					   height:(CGFloat)    height;

-(id)loadJiugonggeCellData:(NSIndexPath *)indexPath cellDatas:(NSArray *)datas;
@end
