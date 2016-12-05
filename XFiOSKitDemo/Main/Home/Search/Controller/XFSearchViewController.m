//
//  XFSearchViewController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 2016/12/3.
//  Copyright © 2016年 DamonLiao. All rights reserved.
//

#import "XFSearchViewController.h"
#import "XFSearchResultsViewController.h"

@interface XFSearchViewController ()


@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation XFSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
    // Create the search results view controller and use it for the UISearchController.
    AAPLSearchResultsViewController *searchResultsController = [self.storyboard instantiateViewControllerWithIdentifier:AAPLSearchResultsViewControllerStoryboardIdentifier];
     */
    
    
    XFSearchResultsViewController *searchResultsVC = [[XFSearchResultsViewController alloc] init];
    
    // Create the search controller and make it perform the results updating.
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsVC];
    self.searchController.searchResultsUpdater = searchResultsVC;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    /*
     Configure the search controller's search bar. For more information on how to configure
     search bars, see the "Search Bar" group under "Search".
     */
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchController.searchBar.placeholder = NSLocalizedString(@"Search", nil);
    
    // Include the search bar within the navigation bar.
    self.navigationItem.titleView = self.searchController.searchBar;
    
    self.definesPresentationContext = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
