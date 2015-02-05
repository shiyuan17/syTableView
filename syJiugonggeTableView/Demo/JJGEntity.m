//
//  JJGEntity.m
//  syJiugonggeTableView
//
//  Created by 世缘 on 15/2/5.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "JJGEntity.h"

@implementation JJGEntity
@synthesize title;
@synthesize icon;

-(void)dealloc{
    self.title = nil;
    self.icon = nil;
    [super dealloc];
}
@end
