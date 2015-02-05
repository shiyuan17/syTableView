SYJiugonggeTableView
===========================

###　　　　　　　　　　　　Author:ShiYuan
###　　　　　　　　　 E-mail:1213423761@qq.com

###如何使用SYJiugonggeTableView
1.将syJiugonggeTableView/Resource文件夹中的所有文件拽入项目中 
2.导入头文件：  
 #import "SYJiugonggeTableView.h"  
 #import "SYJiugonggeEntity.h"  
  
###初始化SYJiugonggeTableView
```objc
//定义frame
CGFloat width = [[UIScreen mainScreen] bounds].size.width;
CGFloat height = [[UIScreen mainScreen] bounds].size.height;
CGRect tbVframe = CGRectMake(0, 20, width, height-50);
//获取自定义view的class名称
NSString *customViewName =  NSStringFromClass([JJGTestView class]);  

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
SYJiugonggeTableView *tbv = [[SYJiugonggeTableView alloc]initWithFrame:tbVframe data:arrayData 
customViewName:customViewName cellColumnNumber:3 apartMargin:10 width:100 height:100];
[self.view addSubview:tbv];
```
###添加数据显示监听器
```objc
//设置view的数据显示
[[NSNotificationCenter defaultCenter] addObserver:self 
selector:@selector(setupCellData:) name:JiugonggeCellDataNotification object:nil];
```

###实现监听器，设置数据显示
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
