//
//  JiugonggeTableView.h
//  syUtil
//
//  Created by 世缘 on 15/2/5.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTableViewCell.h"

@interface SYTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
/**
 *  自定义view的名称
 */
@property (nonatomic,retain) NSString *customViewName;

/**
 *  tableView数据
 */
@property (nonatomic,retain) NSMutableArray *arrayData;

/**
 *  tableViewCell的列数
 */
@property (nonatomic,assign) NSInteger cellColumnNumber;

/**
 *  tableViewCell第一个距离边缘的
 */
@property (nonatomic,assign) CGFloat cellLeftMargin;

/**
 *  每个view的水平间距
 */
@property (nonatomic,assign) CGFloat cellApartMargin;

/**
 *  cell的宽度
 */
@property (nonatomic,assign) CGFloat cellWidth;

/**
 *  cell的高度
 */
@property (nonatomic,assign) CGFloat cellHeight;

/**
 *  默认初始化 列数为1
 *
 *  @param frame    tableView的Frame
 *  @param datas    tableView数据
 *  @param viewName 自定义view的名称
 *  @param height   cell高度
 *
 *  @return tableView
 */
-(id)initWithFrame:(CGRect)frame
              data:(NSArray *)    datas
    customViewName:(NSString *)   viewName
            height:(CGFloat)      height;

/**
 *  初始化tableView
 *
 *  @param frame       tableView的Frame
 *  @param datas       tableView数据
 *  @param viewName    自定义view的名称
 *  @param number      多少列
 *  @param apartMargin 间隔
 *  @param width       每个宽
 *  @param height      每个高
 *
 *  @return 九宫格TableView
 */
-(id)initWithFrame:(CGRect)frame
              data:(NSArray *)datas
    customViewName:(NSString *)viewName
  cellColumnNumber:(NSInteger)number
       apartMargin:(CGFloat)apartMargin
             width:(CGFloat)width
            height:(CGFloat)height;

/**
 *  初始化tableView
 *
 *  @param frame       tableView的Frame
 *  @param datas       tableView数据
 *  @param viewName    自定义view的名称
 *  @param number      多少列
 *  @param leftMargin  离左侧边缘间距
 *  @param apartMargin 间隔
 *  @param width       每个宽
 *  @param height      每个高
 *
 *  @return 九宫格TableView
 */
-(id)initWithFrame:(CGRect)frame
              data:(NSArray *)datas
    customViewName:(NSString *)viewName
  cellColumnNumber:(NSInteger)number
        leftMargin:(CGFloat)leftMargin
       apartMargin:(CGFloat)apartMargin
             width:(CGFloat)width height:(CGFloat)height;

@end
