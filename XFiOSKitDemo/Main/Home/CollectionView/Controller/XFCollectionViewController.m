//
//  XFCollectionViewController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 2016/12/5.
//  Copyright © 2016年 DamonLiao. All rights reserved.
//

#import "XFCollectionViewController.h"
#import "XFCollectionViewFlowLayout.h"


static NSString * const defaultCellReuseID = @"defaultCellReuseID";
static NSString * const defaultHeaderReuseID = @"defaultHeaderReuseID";
static NSString * const defaultFooterReuseID = @"defaultFooterReuseID";

@interface XFCollectionViewController ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate
>

{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
    XFCollectionViewFlowLayout *_flowLayout;
}

@end



@implementation XFCollectionViewController

#pragma mark - ViewSetup

- (void)initialization {
    [super initialization];
    _flowLayout = [self flowLayout];
    _collectionView = [self collectionView];
    
    
}

- (void)addSubviews {
    [super addSubviews];
    [self.view addSubview:_collectionView];
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册 cell
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:defaultCellReuseID];
    
    // 注册 header
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:defaultHeaderReuseID];
    
    // 注册 footer
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:defaultFooterReuseID];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _collectionView.frame = self.view.bounds;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:defaultCellReuseID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:defaultHeaderReuseID forIndexPath:indexPath];
        if(headerView == nil) {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor grayColor];
        
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:defaultFooterReuseID forIndexPath:indexPath];
        if(footerView == nil) {
            footerView = [[UICollectionReusableView alloc] init];
        }
        footerView.backgroundColor = [UIColor lightGrayColor];
        
        return footerView;
    }
    
    return nil;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

/*
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 CGFloat cellWidth = 100;
 return (CGSize){cellWidth,cellWidth};
 }
 */

/*
 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
 {
 return UIEdgeInsetsMake(5, 5, 5, 5);
 }
 */

/*
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
 {
 return 5.f;
 }
 
 
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
 {
 return 5.f;
 }
 */

/*
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
 {
 return (CGSize){Width,44};
 }
 
 
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
 {
 return (CGSize){Width,22};
 }
 */


#pragma mark - UICollectionViewDelegate

/*
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
 {
 return YES;
 }
 
 // 点击高亮
 - (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
 {
 UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
 cell.backgroundColor = [UIColor greenColor];
 }
 
 
 // 选中某item
 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
 {
 
 }
 
 
 // 长按某item，弹出copy和paste的菜单
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 return YES;
 }
 
 // 使copy和paste有效
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
 {
 if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
 {
 return YES;
 }
 
 return NO;
 }
 
 //
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
 {
 if([NSStringFromSelector(action) isEqualToString:@"copy:"])
 {
 //        NSLog(@"-------------执行拷贝-------------");
 [_collectionView performBatchUpdates:^{
 [_data removeObjectAtIndex:indexPath.row];
 [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
 } completion:nil];
 }
 else if([NSStringFromSelector(action) isEqualToString:@"paste:"])
 {
 NSLog(@"-------------执行粘贴-------------");
 }
 }
 */
/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

#pragma mark - LazyLoad

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

- (XFCollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[XFCollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}

@end
