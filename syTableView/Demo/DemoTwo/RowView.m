//
//  RowView.m
//  syJiugonggeTableView
//
//  Created by 世缘 on 15/2/8.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "RowView.h"
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation RowView
@synthesize btn_avatar;
@synthesize lbl_title;
@synthesize img_arrow;


-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView *headLine = [[UIView alloc]init];
//        self.backgroundColor=[UIColor blueColor];
        headLine.frame  = CGRectMake(0, 0, frame.size.width, 0.5);
        headLine.backgroundColor = RGB16(0xc8c7cc);
        [self addSubview:headLine];
        
        self.btn_avatar = [[UIButton alloc]init];
        btn_avatar.frame = CGRectMake(18, 15, 20, 20);
        [self addSubview:btn_avatar];
        [btn_avatar release];
        
        self.lbl_title = [[UILabel alloc]init];
        CGFloat lbl_titleX = btn_avatar.frame.origin.x+btn_avatar.frame.size.width+20;
        lbl_title.frame = CGRectMake(lbl_titleX, 17, 205, 15);
        lbl_title.textColor = RGB16(0x000000);
        lbl_title.backgroundColor = [UIColor clearColor];
        [self addSubview:lbl_title];
        [lbl_title release];
        
        self.img_arrow = [[UIImageView alloc]init];
        CGFloat img_arrowX = frame.size.width-30;
        img_arrow.frame = CGRectMake(img_arrowX, 16, 20, 20);
        img_arrow.image = [UIImage imageNamed:@"toolbar_goforward_normal"];
        [self addSubview:img_arrow];
        [img_arrow release];

    }
    return self;
}

-(void)dealloc{
    self.lbl_title = nil;
    self.btn_avatar = nil;
    self.img_arrow = nil;
    [super dealloc];
}
@end
