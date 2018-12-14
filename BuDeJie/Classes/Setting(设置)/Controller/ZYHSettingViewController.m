//
//  ZYHSettingViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-13.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHSettingViewController.h"

@interface ZYHSettingViewController ()

@end

@implementation ZYHSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = [UIColor redColor];


//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;

}

- (void)back:(UIButton *)button {
    ZYHFunc;
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


@end
