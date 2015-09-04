//
//  JiugonggeView.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "JiugonggeView.h"

@implementation JiugonggeView
-(id)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		_btn_avatar = [[UIButton alloc]init];
		_btn_avatar.frame = CGRectMake(0, 0, frame.size.width, frame.size.height-20);
		[self addSubview:_btn_avatar];
		
		_lbl_title = [[UILabel alloc]init];
		_lbl_title.frame = CGRectMake(0, _btn_avatar.frame.origin.y+_btn_avatar.frame.size.height, _btn_avatar.frame.size.width, 20);
		_lbl_title.text = @"测试";
		_lbl_title.textAlignment = NSTextAlignmentCenter;
		[self addSubview:_lbl_title];
		
	}
	return self;
}
@end
