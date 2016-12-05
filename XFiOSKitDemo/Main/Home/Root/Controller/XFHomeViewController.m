//
//  XFHomeViewController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 02/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFHomeViewController.h"
#import "XFSearchViewController.h"
#import "HomeRootModel.h"


static NSString * const cellReuseID = @"cellReuseID"; // 系统的 cell 重用标识

@interface XFHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

@end

@implementation XFHomeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseID];
    
    [XFNetworking checkNetworkStatusWithBlock:^(XFNetworkStatus status) {
        if (status == XFNetworkStatusNotReachable) {
            [self setTitle:@"无连接..."];
        } else {
            [self setTitle:@"首页"];
        }
    }];
    
    // 指示器
    // [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    // [SVProgressHUD showWithStatus:@"正在加载"];
    
    
}

- (void)initialization {
    [super initialization];
    self.view.backgroundColor = [UIColor colorViewBG];
    _dataArray = [self dataArray];
    
}

- (void)addSubviews {
    [super addSubviews];
    [self.view addSubview:[self tableView]];
    
    
    UIColor *aColor = [UIColor colorWithDisplayP3Red:100/255.0f green:100/255.0f blue:100/255.0f alpha:1];
    // _tableView.backgroundColor = aColor;
    
    /**temp
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(200, 200, 100, 44) normalColor:[UIColor blueColor] title:@"aButton" cornerRadius:3.0f highlightedColor:[UIColor yellowColor] disabledColor:[UIColor grayColor]];
    [self.view addSubview:button];
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.frame = self.view.bounds;
}

#pragma mark - Nav

- (void)setupNavigationBar {
    [super setupNavigationBar];
    
    self.title = NSLocalizedStringFromTable(@"Home", @"Home", nil);;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(test)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_magnifier"] style:UIBarButtonItemStylePlain target:self action:@selector(navLeftItemTouchUpInside)];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellReuseID forIndexPath:indexPath];
    HomeRootModel *model = _dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeRootModel *model = _dataArray[indexPath.row];
    
    UIViewController *VC = [[NSClassFromString(model.destinationVC) alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    
    UITableViewRowAction *removeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除~" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"确定要删除吗" preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            // 执行删除操作
            /*
            [self.wines removeObjectAtIndex:row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
             */
            
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [tableView setEditing:NO animated:YES];
        }];
        
        [alertController addAction:confirmAction];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }];
    
    return @[removeAction];
    
}

#pragma mark - Custom

- (void)navLeftItemTouchUpInside {
    XFSearchViewController *searchVC = [[XFSearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)test {
    NSLog(@"a");
}

#pragma mark - LazyLoad

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionFooterHeight = 0.0f;
    }
    return _tableView;
}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"HomeRootData" ofType:@"plist"];
        NSArray *plistArray = [NSArray arrayWithContentsOfFile:plistPath];
        
        for (NSDictionary *dict in plistArray) {
            HomeRootModel *model = [HomeRootModel modelWithDict:dict];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

@end
