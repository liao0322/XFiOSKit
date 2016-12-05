//
//  XFTabBar.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 2016/12/3.
//  Copyright © 2016年 DamonLiao. All rights reserved.
//

#import "XFTabBar.h"
#import "XFTabBarController.h"

@interface XFTabBar ()
{
    UIButton *_plusButton;
}

@end

@implementation XFTabBar

+ (void)initialize {
    XFTabBar *tabBar = [XFTabBar appearanceWhenContainedInInstancesOfClasses:@[[XFTabBarController class]]];
    
    [tabBar setTintColor:[UIColor colorDomina]];
    
    tabBar.translucent = NO; // 取消tab bar透明
    
    // 去除tab bar顶部的边框
    // tabBar.backgroundImage = [[UIImage alloc] init];
    // tabBar.shadowImage = [[UIImage alloc] init];
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:[self plusButton]];
    }
    return self;
}

#pragma mark - Getter

- (UIButton *)plusButton {
    if (!_plusButton) {
        
        _plusButton = [UIButton buttonWithImageName:@"tabbar_compose_icon_add" backgroundImageName:@"tabbar_compose_button" highlightedImageName:@"tabbar_compose_icon_add_highlighted" highlightedBackgroundImageName:@"tabbar_compose_button_highlighted"];
    }
    return _plusButton;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 跳转tabBarButton位置
    NSInteger count = self.items.count;
    
    //    self.width;
    
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    CGFloat x = 0;
    int i = 0;
    // 私有类:打印出来有个类,但是敲出来没有,说明这个类是系统私有类
    // 遍历子控件 调整布局
    for (UIView *tabBarButton in self.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            
            x = i * btnW;
            
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            
            i++;
        }
    }
    
    // 调整发布按钮位置
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
    
}


@end
