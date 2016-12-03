//
//  XFHomeViewController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFHomeViewController.h"


@interface XFHomeViewController ()

@end

@implementation XFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorViewBG];

    
    
    [XFNetworking checkNetworkStatusWithBlock:^(XFNetworkStatus status) {
        
    }];
    
    // temp
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(200, 200, 100, 44) normalColor:[UIColor blueColor] title:@"aButton" cornerRadius:3.0f highlightedColor:[UIColor yellowColor] disabledColor:[UIColor grayColor]];
    
    

    [self.view addSubview:button];
    // [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    // [SVProgressHUD showWithStatus:@"a"];
    
}

- (void)test {
    NSLog(@"a");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
