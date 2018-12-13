//
//  ZYHFriendTrendViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-10.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHFriendTrendViewController.h"

@interface ZYHFriendTrendViewController ()

@end

@implementation ZYHFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self.view setBackgroundColor:[UIColor grayColor]];
}

- (void)setupNavBar {
    //左边按钮,ios9.0 系统,UIButton 的点击区域过大,可以把 UIButton 包装到 UIView 中,再添加到 UIBarButtonItem 里面.
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
    [leftButton sizeToFit];
    [leftButton addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;

    //中间
    self.navigationItem.title = @"我的关注";
}

- (void)game:(UIButton *)game {
    ZYHFunc;
}

@end
