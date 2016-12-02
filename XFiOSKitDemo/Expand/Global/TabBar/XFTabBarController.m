//
//  XFTabBarController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFTabBarController.h"
#import "XFHomeViewController.h"
#import "XFMeViewController.h"
#import "XFNavigationController.h"

@interface XFTabBarController ()

@end

@implementation XFTabBarController

+ (void)load {
    NSLog(@"");
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有的子控制器
    [self addChildViewControllers];
    
    // 设置所有的子控制器
    [self setupChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)addChildViewControllers {
    
    // 首页
    XFHomeViewController *homeVC = [[XFHomeViewController alloc] init];
    [self p_addChildViewController:homeVC];
    
    // 我
    XFMeViewController *meVC = [[XFMeViewController alloc] init];
    [self p_addChildViewController:meVC];
    
}

- (void)p_addChildViewController:(UIViewController *)viewController {
    
    // 包装一层 navigation 控制器
    XFNavigationController *navController = [[XFNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navController];
    
}

- (void)setupChildViewControllers {
    // 首页
    UINavigationController *navController1 = self.childViewControllers[0];
    navController1.tabBarItem.title = @"首页";
    //    nav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    // 快速生成一个没有渲染图片
    //    nav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    
    // 我
    UINavigationController *navController2 = self.childViewControllers[1];
    navController2.tabBarItem.title = @"我";
    //    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    //    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
}



@end
