//
//  JiugonggeTableView.m
//  syUtil
//
//  Created by 世缘 on 15/2/5.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "SYTableView.h"
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation SYTableView
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
              data:(NSArray *)    datas
    customViewName:(NSString *)   viewName
            height:(CGFloat)      height
{
    CGFloat cellW = [[UIScreen mainScreen] bounds].size.width;
    [self initWithFrame:frame data:datas customViewName:viewName cellColumnNumber:1 apartMargin:0 width:cellW height:height];
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
        self.separatorColor = RGB16(0xc8c7cc);
        self.delegate=self;
        self.dataSource=self;
    }
    self.cellLeftMargin = (frame.size.width - (number*width+((number-1)*apartMargin)))/2;
    if (self.cellLeftMargin<0) {
        self.cellLeftMargin=0;
    }
    [self initWithFrame:frame data:datas customViewName:viewName cellColumnNumber:number leftMargin:cellLeftMargin apartMargin:apartMargin width:width height:height];
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
    SYTableViewCell *cell=nil;
    cell = [tableView dequeueReusableCellWithIdentifier:self.customViewName];
    if(cell==nil){
        cell = [[[SYTableViewCell alloc]initWithReuseIdentifier:self.customViewName customerViewName:customViewName cellColumnNumber:self.cellColumnNumber leftMargin:self.cellLeftMargin apartMargin:self.cellApartMargin width:self.cellWidth height:self.cellHeight] autorelease];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    [cell loadJiugonggeCellData:indexPath cellDatas:self.arrayData];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self deselectRowAtIndexPath:
//    [self indexPathForSelectedRow] animated:YES];
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)dealloc{
    self.arrayData = nil;
    self.customViewName = nil;
    [super dealloc];
}
@end
