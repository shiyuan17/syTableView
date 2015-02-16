//
//  JiugonggeCell.m
//  syUtil
//
//  Created by 世缘 on 15/2/4.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import "SYTableViewCell.h"
#import "SYTableViewEntity.h"
@implementation SYTableViewCell
@synthesize cellColumnNumber;
@synthesize cellDatas;

-(id)init{
    if (self = [super init]) {
        self.cellDatas = [[NSMutableArray alloc]init];
    }
    return self;
}

#pragma mark 初始化cell
- (id)initWithReuseIdentifier:(NSString *) reuseIdentifier
             customerViewName:(NSString *) viewName
             cellColumnNumber:(NSInteger) columnNumber
                   leftMargin:(CGFloat) leftMargin
                  apartMargin:(CGFloat) apartMargin
                        width:(CGFloat) width
                       height:(CGFloat) height{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self){
        self.cellColumnNumber = columnNumber;
        for (int i = 0; i<self.cellColumnNumber; i++) {
            CGFloat x;
            if(i==0){
                x=leftMargin;
            }else{
                x=(width*i)+(apartMargin*i)+leftMargin;
            }
            CGRect viewFrame = CGRectMake(x, 0, width, height);
            Class  cls =  NSClassFromString(viewName);
            UIView *view = [[cls alloc] initWithFrame:viewFrame];
            view.tag = i+kTagStart;
            [self.contentView addSubview:view];
            [view release];
        }
    }
    return self;
}

#pragma mark 计算
-(id)loadJiugonggeCellData:(NSIndexPath *)indexPath cellDatas:(NSArray *)datas{
    self.cellDatas = [NSMutableArray arrayWithArray:datas];
    NSInteger location = indexPath.row * cellColumnNumber;
    NSInteger length = cellColumnNumber;
    
    if (location + length >= self.cellDatas.count) {
        length = self.cellDatas.count - location;
    }
    NSRange range = NSMakeRange(location, length);
    NSArray *rowProducts = [self.cellDatas subarrayWithRange:range];
    [self setRowProducts:rowProducts];
    self.backgroundColor = [UIColor clearColor];
    return self;
}

#pragma mark 设置cell数据
-(void) setRowProducts:(NSArray *)products{
    for (int i = 0; i<cellColumnNumber; i++) {
        int tag = i + kTagStart;
        UIView *view = (UIView *)[self viewWithTag:tag];
        if (i>products.count - 1) {
            view.hidden = YES;
        } else {
            view.hidden = NO;
            SYTableViewEntity *entity = [[SYTableViewEntity alloc]init];
            entity.customView = view;
            entity.entity = products[i];
            [[NSNotificationCenter defaultCenter] postNotificationName:JiugonggeCellDataNotification object:entity];
            [entity release];
        }
    }
}
@end
