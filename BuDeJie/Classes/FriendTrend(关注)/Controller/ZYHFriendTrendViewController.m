//
//  ZYHFriendTrendViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-10.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHFriendTrendViewController.h"
#import "ZYHLoginViewController.h"

@interface ZYHFriendTrendViewController ()

@end

@implementation ZYHFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupNavBar];

    //初始化 view
    [self setupView];
}

- (void)setupView {
    UILabel *uiLabel = [[UILabel alloc] init];

    NSString *str = @"快快登录吧,关注百思最in牛人 "\
 "好友动态让你过把瘾~" \
 "欧耶~~~!";
    uiLabel.text = str;
    [uiLabel sizeToFit];
    uiLabel.center = self.view.center;
    uiLabel.numberOfLines = 0;
    uiLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:uiLabel];


    UIImageView *uiImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_cry_icon"]];
    uiImageView.center = CGPointMake(self.view.center.x, self.view.center.y - 50);
    [self.view addSubview:uiImageView];


    UIButton *uiButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [uiButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal];
    [uiButton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateHighlighted];
    [uiButton setTitle:@"立即登录注册" forState:UIControlStateNormal];
    [uiButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [uiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    [uiButton sizeToFit];
    uiButton.center = CGPointMake(self.view.center.x, self.view.center.y + 50);
    [uiButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uiButton];

}

- (void)loginClick {
    ZYHLoginViewController *loginVC = [[ZYHLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:^{

    }];
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
