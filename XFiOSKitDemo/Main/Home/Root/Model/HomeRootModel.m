//
//  HomeRootModel.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 2016/12/5.
//  Copyright © 2016年 DamonLiao. All rights reserved.
//

#import "HomeRootModel.h"

@implementation HomeRootModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
    
}

@end
