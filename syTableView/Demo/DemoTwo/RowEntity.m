//
//  RowEntity.m
//  syJiugonggeTableView
//
//  Created by 世缘 on 15/2/8.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "RowEntity.h"

@implementation RowEntity
@synthesize string_icon;
@synthesize string_title;


-(void)dealloc{
    self.string_title = nil;
    self.string_icon = nil;
    [super dealloc];
}
@end
