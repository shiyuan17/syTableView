//
//  SYTableView.h
//  SyUtils
//
//  Created by 世缘 on 15/8/17.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTableViewEntity.h"

typedef void (^setupData)(SYTableViewEntity*);
typedef void (^tableViewSelectedBlock)(NSIndexPath *);
@interface SYTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *sectionHeaderView;/**<头部sectionView*/

@property (nonatomic,strong) NSString  *customerViewName;/**<自定义view名称*/
@property (nonatomic,strong) NSMutableArray   *arrayDatas;/**<数据源数据*/
@property (nonatomic,strong) NSArray *cellHeightArrays;/**cell动态高度数据*/
@property (weak, nonatomic) id target;
@property (assign, nonatomic) SEL setupDataAction;
@property (nonatomic, copy) void (^setupDataCallBack)(SYTableViewEntity *);
@property (nonatomic,copy) tableViewSelectedBlock selectBlock;
@property (nonatomic,assign) SEL selectedMethod;

@property (nonatomic,assign) NSInteger columnNumber;/**<列数*/
@property (nonatomic,assign) CGFloat   leftMargin;/**<左边距*/
@property (nonatomic,assign) CGFloat   apartMargin;/**<中间间距*/
@property (nonatomic,assign) CGFloat   cellWidth;//**<cell的宽度/

@property (nonatomic,assign) BOOL  isSectionStickyHeader;/**<section是否黏住状况，是否冻结*/

/**
 *  初始化单行tableView sel回调
 *  frame,customerViewName自定义view的名称，target设置data的目标，action执行的方法
 */
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName target:(id)target action:(SEL)action;

/**
 *  初始化单行tableView block回调
 *  frame,customerViewName自定义view的名称，target设置data的目标，action执行的方法
 */
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName setupData:(void (^)(SYTableViewEntity *))setupData;

/**
 *  初始化多列tableView sel回调
 *  frame,customerViewName自定义view的名称，target设置data的目标，action执行的方法
 *  间隙平均分布 
 *  默认值5
 */
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column target:(id)target action:(SEL)action;

/**
 *  初始化多列tableView block回调
 *  frame,customerViewName自定义view的名称，target设置data的目标，action执行的方法
 *  间隙平均分布
 *  默认值5
 */
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column setupData:(void (^)(SYTableViewEntity *))setupData;

/**
 *  初始化多列tableView sel回调
 *  frame,customerViewName自定义view的名称，target设置data的目标，action执行的方法
 *  leftMargin左右边距  margin中间间距
 */
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column leftMargin:(CGFloat)lMargin apartMargin:(CGFloat)margin target:(id)target action:(SEL)action;

/**
 *  初始化多列tableView block回调
 *  frame,customerViewName自定义view的名称，target设置data的目标，action执行的方法
 *  间隙平均分布
 *  leftMargin左右边距  margin中间间距
 */
- (id)initWithFrame:(CGRect)frame customerViewName:(NSString *)viewName columnNumber:(int)column leftMargin:(CGFloat)lMargin apartMargin:(CGFloat)margin setupData:(void (^)(SYTableViewEntity *))setupData;
@end
