SYTableView 快速tableView创建
===========================

###　　　　　　　　　　　　Author:ShiYuan
###　　　　　　　　　 E-mail:1213423761@qq.com  

###如何使用SYTableView
1.将syTableView/Resource文件夹中的所有文件拽入项目中 
2.导入头文件：  
 #import "SYTableViewHeader.h" 
 
 ###创建普通TableView如下
 ```objc
//1.获取自定义view的class名称
NSString *customViewName =  NSStringFromClass([JJGTestView class]);
//2.初始化TableView
//tbVframe tableView的frame,arrayDatas是tableView的数据数组
SYTableView *tbv = [[SYTableView alloc]initWithFrame:tbVframe data:arrayDatas customViewName:customViewName height:50];
 [self.view addSubview:tbv];
 //3.添加数据监听
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupCellData:) name:JiugonggeCellDataNotification object:nil];
 //4.实现监听，对数据赋值
 //示例如下：
 -(void)setupCellData:(NSNotification *)notification{
    //取出自定义view和自定义的实体
    SYTableViewEntity *obj = [notification object];
    RowView *rowView = (RowView *)obj.customView;
    RowEntity *rowEntity = obj.entity;
    
    [rowView.btn_avatar setImage:[UIImage imageNamed:rowEntity.string_icon] forState:UIControlStateNormal];
    rowView.lbl_title.text = rowEntity.string_title;
}
 ```
  
###创建九宫格TableView如下：
效果：  
![](https://github.com/shiyuan17/SYJiugonggeTableView/blob/master/iosTableView.jpg)
```objc
//获取自定义view的class名称
NSString *customViewName =  NSStringFromClass([JJGTestView class]);
/**
 *  初始化tableView
 *  @param frame       tableView的Frame
 *  @param datas       tableView数据 array数组
 *  @param viewName    自定义view的名称
 *  @param number      多少列
 *  @param apartMargin 间隔
 *  @param width       每个宽
 *  @param height      每个高
 */
SYTableView *tbv = [[SYTableView alloc]initWithFrame:tbVframe data:arrayData customViewName:customViewName cellColumnNumber:3 apartMargin:10 width:100 height:100];
[self.view addSubview:tbv];
```
###添加数据显示监听器
```objc
//设置view的数据显示
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupCellData:) name:JiugonggeCellDataNotification object:nil];
```

###实现监听器，设置数据显示,示例：
```objc
-(void)setupCellData:(NSNotification *)notification{
    //自定义的实体
    SYJiugonggeEntity *jjgEntity = [notification object];
    //自定义的view
    JJGTestView *tv = (JJGTestView *)jjgEntity.customView;
    JJGEntity *entity = jjgEntity.entity;
    //赋值
    NSString *icon = [NSString stringWithFormat:@"%@.jpg",entity.icon];
    [tv.btn_avatar setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    tv.lbl_title.text = entity.title;
}
```

## 期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢
