//
//  ZYHEssenceViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-10.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHEssenceViewController.h"

@interface ZYHEssenceViewController ()

@end

@implementation ZYHEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupNavBar {
    //左边按钮,ios9.0 系统,UIButton 的点击区域过大,可以把 UIButton 包装到 UIView 中,再添加到 UIBarButtonItem 里面.
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"nav_item_game_icon"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"nav_item_game_click_icon"] forState:UIControlStateHighlighted];
    [leftButton sizeToFit];
    [leftButton addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;

    //中间
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = imageView;

    //右边按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"navigationButtonRandom"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"navigationButtonRandomClick"] forState:UIControlStateHighlighted];
    [rightButton sizeToFit];
    [rightButton addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)game:(UIButton *)game {
    ZYHFunc;
}
@end
