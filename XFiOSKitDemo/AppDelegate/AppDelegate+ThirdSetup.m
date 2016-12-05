//
//  AppDelegate+ThirdSetup.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 2016/12/4.
//  Copyright © 2016年 DamonLiao. All rights reserved.
//

#import "AppDelegate+ThirdSetup.h"
#import <UMMobClick/MobClick.h>

@implementation AppDelegate (ThirdSetup)

- (void)setupUMengAnalytics {
    
    UMConfigInstance.appKey = AppKeyUMeng;
    
#if DEBUG
    UMConfigInstance.channelId = @"Local Debug";
#else
    UMConfigInstance.channelId = @"App Store"; // 默认是@"App Store"渠道
#endif
    
    // 获取版本信息
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    
    // 配置以上参数后调用此方法初始化SDK！
    [MobClick startWithConfigure:UMConfigInstance];
    
    // 设置是否对日志信息进行加密, 默认NO(不加密)
    [MobClick setEncryptEnabled:YES];
    
    
#if JD_DEBUG
    // 打印友盟集成测试设备信息
    [self printUMengTestDeviceInfo];
#endif
}

#pragma mark - Private

- (void)printUMengTestDeviceInfo {
    Class cls = NSClassFromString(@"UMANUtil");
    SEL deviceIDSelector = @selector(openUDIDString);
    NSString *deviceID = nil;
    if(cls && [cls respondsToSelector:deviceIDSelector]){
        deviceID = [cls performSelector:deviceIDSelector];
    }
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:@{@"oid" : deviceID}
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    
    NSLog(@"UMeng Test Device Info: %@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
}



@end
