//
//  ZYHNewViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-10.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHNewViewController.h"
#import "ZYHSubTagViewController.h"


@interface ZYHNewViewController ()

@end

@implementation ZYHNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self setupNavBar];
}

- (void)setupNavBar {
    //左边按钮,ios9.0 系统,UIButton 的点击区域过大,可以把 UIButton 包装到 UIView 中,再添加到 UIBarButtonItem 里面.
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [leftButton sizeToFit];
    [leftButton addTarget:self action:@selector(tagClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)tagClick:(UIButton *)game {
    ZYHFunc;
    ZYHSubTagViewController *subTagVC = [[ZYHSubTagViewController alloc] init];
    subTagVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:subTagVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

@end
