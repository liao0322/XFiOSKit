//
//  XFBaseViewController.h
//  XFiOSKitDemo

//  整个项目 ViewController 的基类

//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFBaseViewController : UIViewController

/// 创建UI前初始化成员变量数据
- (void)initialization;

/// 配置导航栏
- (void)setupNavigationBar;

/// 添加子控件
- (void)addSubviews;

@end
