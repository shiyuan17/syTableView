//
//  SYTableViewEntity.h
//  SyUtils
//
//  Created by 世缘 on 15/8/17.
//  Copyright (c) 2015年 shiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SYTableViewEntity : NSObject
@property (nonatomic,strong) UIView *customView;
@property (nonatomic,strong) id entity;
@property (nonatomic,strong) NSIndexPath *indexPath;
@end
