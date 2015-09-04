//
//  RowView.m
//  SYTableView
//
//  Created by 世缘 on 15/9/3.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import "RowView.h"
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation RowView
-(id)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		UIView *headLine = [[UIView alloc]init];
		headLine.frame  = CGRectMake(0, 0, frame.size.width, 0.5);
		headLine.backgroundColor = RGB16(0xc8c7cc);
		[self addSubview:headLine];
		
		_btn_avatar = [[UIButton alloc]init];
		_btn_avatar.frame = CGRectMake(18, 15, 20, 20);
		[self addSubview:_btn_avatar];
		
		_lbl_title = [[UILabel alloc]init];
		CGFloat lbl_titleX = _btn_avatar.frame.origin.x+_btn_avatar.frame.size.width+20;
		_lbl_title.frame = CGRectMake(lbl_titleX, 17, 205, 15);
		_lbl_title.textColor = RGB16(0x000000);
		_lbl_title.backgroundColor = [UIColor clearColor];
		[self addSubview:_lbl_title];
		
		_img_arrow = [[UIImageView alloc]init];
		CGFloat img_arrowX = frame.size.width-30;
		_img_arrow.frame = CGRectMake(img_arrowX, 16, 20, 20);
		_img_arrow.image = [UIImage imageNamed:@"toolbar_goforward_normal"];
		[self addSubview:_img_arrow];
		
	}
	return self;
}
@end
