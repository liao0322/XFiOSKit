//
//  XFBaseViewController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFBaseViewController.h"
#import <UMMobClick/MobClick.h>


@interface XFBaseViewController ()

@end

@implementation XFBaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialization];
    [self setupNavigationBar];
    [self addSubviews];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:NSStringFromClass([self class])];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:NSStringFromClass([self class])];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom

- (void)initialization {
    self.view.backgroundColor = [UIColor colorViewBG];
}

- (void)setupNavigationBar {
    
}

- (void)addSubviews {
    
}


@end
