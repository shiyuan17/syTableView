SYTableView 快速tableView创建
===========================
功能简介
========
妈妈再也不用担心我写重复性的代码了，提供快速创建tableView的方式   
1.方便快捷的创建普通型tableView   
2.提供九宫格灵活控制   
3.section创建   
4.动态高度   

###如何使用SYTableView
使用sytableview快速创建只需要三步，1.引入文件 2.初始化 3.设置数据   
1.将SYTableView/SYTableView文件夹中的所有文件拽入项目中    
2.导入头文件：  
 #import "SYTableViewHeader.h" 
 
 1.普通弄tableView创建如下： 
 效果图：   
 ![](https://github.com/shiyuan17/syTableView/blob/master/tableview.png)   
 初始化如下：   
 ```  objc
 //1.引入
#import "SYTableViewHeader.h"
  //设置tableFrame
  CGRect tbvFrame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
	//获取自定义view的className
	NSString *rowViewClass = NSStringFromClass([RowView class]);
	//2.初始化tableView
	SYTableView *rowTbv = [[SYTableView alloc]initWithFrame:tbvFrame customerViewName:rowViewClass target:self action:@selector(rowListDataSetup:)];
	//指定数据
	rowTbv.arrayDatas = [NSMutableArray arrayWithArray:[DemoDataManager getRowViewData]];
	rowTbv.rowHeight = 45;//指定行高
	[self.view addSubview:rowTbv];
}
```

2.设置table数据
```  objc
	//3.为tableView设置数据
- (void)rowListDataSetup:(SYTableViewEntity *)ent{
	RowView *rowView = (RowView *)ent.customView;//取出自定义view
	RowViewModel *model = ent.entity;//取出数据中的实体
	//赋值
	[rowView.btn_avatar setImage:[UIImage imageNamed:model.string_icon] forState:UIControlStateNormal];
	rowView.lbl_title.text = model.string_title;
```

更多的使用方法尽在demo中   
如有遇到问题或者有好的建议，欢迎联系我   
author:shiyuan   
联系方式：qq:1213423761  mail:1213423761@qq.com  
