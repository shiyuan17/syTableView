//
//  JiugonggeCell.h
//  syUtil
//
//  Created by 世缘 on 15/2/4.
//  Copyright (c) 2015年 sy. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTagStart 1000
#define JiugonggeCellDataNotification @"JiugonggeCellDataNotification"

@interface SYTableViewCell : UITableViewCell
@property (nonatomic,assign) NSInteger cellColumnNumber;
@property (nonatomic,assign) NSArray *cellDatas;

- (id)initWithReuseIdentifier:(NSString *) reuseIdentifier
   customerViewName:(NSString *) viewName
   cellColumnNumber:(NSInteger) columnNumber
         leftMargin:(CGFloat) leftMargin
        apartMargin:(CGFloat) apartMargin
              width:(CGFloat) width
             height:(CGFloat) height;

-(id)loadJiugonggeCellData:(NSIndexPath *)indexPath cellDatas:(NSArray *)datas;

-(void) setRowProducts:(NSArray *)products;
@end
