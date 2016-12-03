//
//  XFNavigationController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFNavigationController.h"

@interface XFNavigationController ()

@end

@implementation XFNavigationController

+ (void)initialize {
    
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[XFNavigationController class]]];
    
    navBar.translucent = NO; // 取消nav bar透明
    
    // 去除底部的边框线
    [navBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[[UIImage alloc] init]];
    
    // 设置背景图片
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"navigation_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置底部阴影
    [navBar setShadowImage:[UIImage imageNamed:@"navigation_bar_bg"]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
