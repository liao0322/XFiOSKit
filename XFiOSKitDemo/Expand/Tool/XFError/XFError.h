//
//  XFError.h
//  XFiOSKitDemo
//
//  Created by DamonLiao on 03/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFError : NSObject

/**
 *  网络错误相关
 *
 *  @param code Status Code
 */
+ (NSError *)webError:(int)code;

@end
