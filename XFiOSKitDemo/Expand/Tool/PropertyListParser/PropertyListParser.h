//
//  JDPropertyListParser.h
//
//  Created by 廖晓飞 on 16/1/14.
//  Copyright © 2016年 jidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@interface PropertyListParser : NSObject

+ (TreeNode *)parserPListFileWithName:(NSString *)plistName;

@end
