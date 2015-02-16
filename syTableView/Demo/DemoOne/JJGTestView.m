//
//  JJCTestView.m
//  syUtil
//
//  Created by 世缘 on 15/2/4.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "JJGTestView.h"

@implementation JJGTestView
@synthesize btn_avatar;
@synthesize lbl_title;

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.btn_avatar = [[[UIButton alloc]init]autorelease];
        btn_avatar.frame = CGRectMake(0, 0, frame.size.width, frame.size.height-20);
        [self addSubview:btn_avatar];
        
        self.lbl_title = [[[UILabel alloc]init]autorelease];
        lbl_title.frame = CGRectMake(0, btn_avatar.frame.origin.y+btn_avatar.frame.size.height, btn_avatar.frame.size.width, 20);
        lbl_title.text = @"测试";
        lbl_title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lbl_title];
        
    }
    return self;
}

-(void)dealloc{
    self.btn_avatar = nil;
    self.lbl_title = nil;
    [super dealloc];
}
@end
