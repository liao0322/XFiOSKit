//
//  JDTreeNode.h
//
//  Created by 廖晓飞 on 16/1/14.
//  Copyright © 2016年 jidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (nonatomic) id obj;
@property (nonatomic,weak) TreeNode *parent;
@property (nonatomic) NSMutableArray *childern;

/**
 *  通过一个字典创建TreeNode
 */
+ (TreeNode *)treeNodeWithDictionary:(NSDictionary *)dic;

/**
 *  通过一个数组创建TreeNode
 */
+ (TreeNode *)treeNodeWithArray:(NSArray *)arr;

/**
 *  添加子节点
 */
- (void)addChildNode:(TreeNode *)node;

- (NSUInteger)childrenCount;

- (NSUInteger)levelCount;

- (TreeNode *)childAtIndex:(NSInteger)index;
- (TreeNode *)childWithTitle:(NSString *)title;

- (BOOL)isLeaf;
- (BOOL)isRoot;
- (NSString *)title;
@end
