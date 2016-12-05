//
//  XFNavigationController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFNavigationController.h"

@interface XFNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) id popGesture;

@property (nonatomic, getter=isPushing) BOOL pushing;

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
    
    navBar.tintColor = [UIColor colorDomina];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popGesture = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Override

// 自定义返回按钮样式
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.pushing == YES) {
        NSLog(@"被拦截");
        return;
    } else {
        NSLog(@"push");
        self.pushing = YES;
    }

    
    if (self.viewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationButtonReturn"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - Private

- (void)back {
    [self popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate
// 当控制器显示完毕的时候调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.pushing = NO;
    
    if (self.viewControllers[0] == viewController) {
        self.interactivePopGestureRecognizer.delegate  = self.popGesture;
        
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

@end
