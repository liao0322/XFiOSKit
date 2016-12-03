//
//  XFDiscoverViewController.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 2016/12/3.
//  Copyright © 2016年 DamonLiao. All rights reserved.
//

#import "XFDiscoverViewController.h"
#import <MapKit/MapKit.h>

@interface XFDiscoverViewController ()
{
    MKMapView *_mapView;
}

@end

@implementation XFDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[MKMapView alloc] init];
    // _mapView.mapType = MKMapTypeHybrid;
    [self.view addSubview:_mapView];
    
    
    
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _mapView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
