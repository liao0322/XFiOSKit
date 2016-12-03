//
//  XFTabBarController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFTabBarController.h"
#import "XFNavigationController.h"

#import "XFHomeViewController.h"
#import "XFMessageViewController.h"
#import "XFDiscoverViewController.h"
#import "XFMeViewController.h"

#import "XFTabBar.h"

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
    
    // 自定义 tab bar
    [self setupTabBar];
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
    
    // 消息
    XFMessageViewController *messageVC = [[XFMessageViewController alloc] init];
    [self p_addChildViewController:messageVC];
    
    // 发现
    XFDiscoverViewController *discoverVC = [[XFDiscoverViewController alloc] init];
    [self p_addChildViewController:discoverVC];
    
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
    UINavigationController *homeNavController = self.childViewControllers[0];
    homeNavController.tabBarItem.title = @"首页";
    homeNavController.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    homeNavController.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabbar_home_highlighted"];
    
    // 消息
    UINavigationController *messageNavController = self.childViewControllers[1];
    messageNavController.tabBarItem.title = @"消息";
    messageNavController.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    messageNavController.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabbar_message_center_highlighted"];
    
    // 发现
    UINavigationController *discoverNavController = self.childViewControllers[2];
    discoverNavController.tabBarItem.title = @"发现";
    discoverNavController.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    discoverNavController.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabbar_discover_highlighted"];
    
    // 我
    UINavigationController *meNavController = self.childViewControllers[3];
    meNavController.tabBarItem.title = @"我";
    meNavController.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    meNavController.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabbar_profile_highlighted"];

}

- (void)setupTabBar {
    XFTabBar *tabBar = [[XFTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}



@end
