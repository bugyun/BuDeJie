//
//  ZYHMeViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-10.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHMeViewController.h"
#import "ZYHSettingViewController.h"

@interface ZYHMeViewController ()

@end

@implementation ZYHMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];

    self.view.backgroundColor = [UIColor greenColor];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithOriginalModeNamed:@"mine-moon-icon-click"]];
//    [imageView sizeToFit];
//    UIBarButtonItem *uiBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
//    self.navigationItem.backBarButtonItem = uiBarButtonItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"navigationButtonReturn"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"navigationButtonReturn"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}


- (void)setupNavBar {
    //中间
    self.navigationItem.title = @"我的";
//    UILabel *uiLabel = [[UILabel alloc] init];
//    uiLabel.text = @"我的";
//    uiLabel.font = [UIFont boldSystemFontOfSize:20];
//    [uiLabel sizeToFit];
//    self.navigationItem.titleView = uiLabel;

    //右边按钮
    //夜间模式
    UIButton *rightSettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightSettingButton setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [rightSettingButton setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    [rightSettingButton sizeToFit];
    [rightSettingButton addTarget:self action:@selector(setting:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightSettingButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightSettingButton];

    UIButton *rightNightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightNightButton setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [rightNightButton setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateSelected];
    [rightNightButton sizeToFit];
    [rightNightButton addTarget:self action:@selector(night:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightNightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightNightButton];
    self.navigationItem.rightBarButtonItems = @[rightSettingButtonItem, rightNightButtonItem];


}

- (void)night:(UIButton *)button {
    button.selected = !button.selected;
    ZYHFunc;
}

- (void)setting:(UIButton *)button {
    ZYHFunc;
    ZYHSettingViewController *settingVC = [[ZYHSettingViewController alloc] init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}

@end
