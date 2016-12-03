//
//  JDPropertyListParser.m
//
//  Created by 廖晓飞 on 16/1/14.
//  Copyright © 2016年 jidu. All rights reserved.
//

#import "PropertyListParser.h"

@implementation PropertyListParser

+ (TreeNode *)parserPListFileWithName:(NSString *)plistName {
    TreeNode *node = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    if (dict) {
        node = [TreeNode treeNodeWithDictionary:dict];
    } else {
        NSArray *arr = [ NSArray arrayWithContentsOfFile:filePath];
        node = [TreeNode treeNodeWithArray:arr];
    }
    return node;
}
@end
