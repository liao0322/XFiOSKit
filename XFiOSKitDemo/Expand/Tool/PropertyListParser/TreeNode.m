//
//  JDTreeNode.m
//
//  Created by 廖晓飞 on 16/1/14.
//  Copyright © 2016年 jidu. All rights reserved.
//

#import "TreeNode.h"
//#import "ZinkSortArray.h"

@interface TreeNode ()

@property (nonatomic) NSMutableDictionary *childernDic;

@end

@implementation TreeNode

+ (TreeNode *)treeNodeWithDictionary:(NSDictionary *)dic {
    TreeNode *root = [[TreeNode alloc] init];
    [root p_addChildrenWithDictionary:dic];
    return root;
}

+ (TreeNode *)treeNodeWithArray:(NSArray *)arr {
    TreeNode *root = [[TreeNode alloc] init];
    [root p_addChildrenWithArray:arr];
    return root;
}

- (void)p_addChildrenWithDictionary:(NSDictionary*)dic {
    NSArray* keys = [dic allKeys];
    for (id key in keys) {
        TreeNode *node = [[TreeNode alloc] init];
        node.obj = key;
        id value = [dic objectForKey:key];
        [node p_buildChildWithObj:value ];
        [self addChildNode:node ];
    }
}

- (void)p_addChildrenWithArray:(NSArray*)arr {
    for (id obj in arr ) {
        [self p_buildChildWithObj:obj ];
    }
}

- (void)p_buildChildWithObj:(id)obj {
    if ([obj isKindOfClass:[NSArray class]]) {
        [self p_addChildrenWithArray:obj ];
    } else if ([obj isKindOfClass:[NSDictionary class]]) {
        [self p_addChildrenWithDictionary:obj ];
    } else {
        [self p_addChildWithSingleObj:obj ];
    }
}

- (void)p_addChildWithSingleObj:(id)obj {
    TreeNode *node = [[TreeNode alloc] init];
    node.obj = obj;
    [self addChildNode:node ];
}

- (void)addChildNode:(TreeNode *)node {
    node.parent = self;
    if (_childern == nil) {
        _childern = [[NSMutableArray alloc] init];
    }
    [_childern addObject:node];
}

- (NSUInteger)childrenCount {
    return [_childern count];
}

- (NSUInteger)levelCount {
    NSUInteger n = 0;
    TreeNode *child = [self childAtIndex:0];
    while (child) {
        n++;
        child = [child childAtIndex:0];
    }
    return n;
}

- (TreeNode *)childAtIndex:(NSInteger)index {
    return [_childern objectAtIndex:index ];
}

- (TreeNode *)childWithTitle:(NSString *)title {
    return self.childernDic[title];
}

- (BOOL)isLeaf {
    return self.childern == nil || self.childern.count == 0;
}

- (BOOL)isRoot {
    return self.parent.obj == nil;
}

- (NSString *)title {
    if ([self.obj isKindOfClass:[NSString class]]) {
        return self.obj;
    }
    return nil;
}
- (NSMutableDictionary *)childernDic {
    if (!_childernDic) {
        _childernDic = [NSMutableDictionary dictionary];
        for (TreeNode *child in _childern) {
            [_childernDic setObject:child forKey:[child title]];
        }
    }
    return _childernDic;
}

@end
