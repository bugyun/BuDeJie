//
//  ZYHADViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-13.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHADViewController.h"
#import "ZYHHomeTabBarController.h"

@interface ZYHADViewController ()

@end

@implementation ZYHADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *uiImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ZYHScreenW, ZYHScreenH)];
    uiImageView.image = [UIImage imageNamed:@"LaunchImage"];
    [self.view addSubview:uiImageView];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"跳过(0)" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    button.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    CGSize cgSize = [button sizeThatFits:CGSizeZero];
    button.frame = CGRectMake(ZYHScreenW - cgSize.width - 10, 25, cgSize.width, cgSize.height);
    [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)go:(id)go {
    ZYHHomeTabBarController *zyhHomeTabBarController = [[ZYHHomeTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = zyhHomeTabBarController;
}

- (void)dealloc {
    ZYHLog(@"ZYHADViewController 销毁");
}


@end
