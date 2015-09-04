//
//  TestView.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "TestView.h"

@implementation TestView
-(id)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		_lblText = [[UILabel alloc]init];
		_lblText.frame = CGRectMake(10, 10, 100, 30);
		_lblText.text = @"测试";
		_lblText.textColor = [UIColor orangeColor];
		[self addSubview:_lblText];
		
		UIView *line = [[UIView alloc]init];
		line.frame = CGRectMake(0, frame.size.height-1, frame.size.width, 0.5);
		line.backgroundColor = [UIColor grayColor];
		[self addSubview:line];
	}
	return self;
}
@end
