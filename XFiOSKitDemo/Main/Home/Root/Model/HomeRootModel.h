//
//  HomeRootModel.h
//  XFiOSKitDemo
//
//  Created by DamonLiao on 2016/12/5.
//  Copyright © 2016年 DamonLiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeRootModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *destinationVC;

@property (strong, nonatomic) void(^actionBlock)();

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
