//
//  JiugonggeTableView.m
//  syUtil
//
//  Created by 世缘 on 15/2/5.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "SYJiugonggeTableView.h"


@implementation SYJiugonggeTableView
@synthesize customViewName;
@synthesize arrayData;
@synthesize cellColumnNumber;
@synthesize cellLeftMargin;
@synthesize cellApartMargin;
@synthesize cellWidth;
@synthesize cellHeight;

-(id) init{
    if (self = [super init]) {
        self.arrayData = [[NSMutableArray alloc]init];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
              data:(NSArray *)              datas
              customViewName:(NSString *)   viewName
              cellColumnNumber:(NSInteger)  number
              apartMargin:(CGFloat)         apartMargin
              width:(CGFloat)               width
              height:(CGFloat)              height
{
    
    if (self = [super initWithFrame:frame]) {
        self.customViewName = viewName;
        self.arrayData = [NSMutableArray arrayWithArray:datas];
        self.cellColumnNumber = number;
        self.cellApartMargin = apartMargin;
        self.cellWidth = width;
        self.cellHeight = height;
        
        self.cellLeftMargin = (frame.size.width - (number*cellWidth+((number-1)*cellApartMargin)))/2;
        if (self.cellLeftMargin<0) {
            self.cellLeftMargin=0;
        }
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate=self;
        self.dataSource=self;
    }
    return self;
}

-(id)initWithFrame:(CGRect)                 frame
            data:(NSArray *)                datas
            customViewName:(NSString *)     viewName
            cellColumnNumber:(NSInteger)    number
            leftMargin:(CGFloat)            leftMargin
            apartMargin:(CGFloat)           apartMargin
            width:(CGFloat)                 width
            height:(CGFloat)                height
{
    
    if (self = [super init]) {
        self.customViewName = viewName;
        self.arrayData = [NSMutableArray arrayWithArray:datas];
        self.cellColumnNumber = number;
        self.cellLeftMargin = leftMargin;
        self.cellApartMargin = apartMargin;
        self.cellWidth = width;
        self.cellHeight = height;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate=self;
        self.dataSource=self;
    }
    return self;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!self.arrayData) {
        return 0;
    }
    return (self.arrayData.count + self.cellColumnNumber - 1) / self.cellColumnNumber;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYJiugonggeCell *cell=nil;
    cell = [tableView dequeueReusableCellWithIdentifier:self.customViewName];
    if(cell==nil){
        cell = [[[SYJiugonggeCell alloc]initWithReuseIdentifier:self.customViewName customerViewName:customViewName cellColumnNumber:self.cellColumnNumber leftMargin:self.cellLeftMargin apartMargin:self.cellApartMargin width:self.cellWidth height:self.cellHeight] autorelease];
    }
    [cell loadJiugonggeCellData:indexPath cellDatas:self.arrayData];
    return cell;
}

-(void)dealloc{
    self.arrayData = nil;
    self.customViewName = nil;
    [super dealloc];
}
@end
