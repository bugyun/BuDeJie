//
//  ZYHHomeTabBarController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-10.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHHomeTabBarController.h"
#import "ZYHEssenceViewController.h"
#import "ZYHFriendTrendViewController.h"
#import "ZYHMeViewController.h"
#import "ZYHNewViewController.h"
#import "ZYHPublishViewController.h"


@interface ZYHHomeTabBarController ()

@end

@implementation ZYHHomeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //精华界面
    ZYHEssenceViewController *essenceVC = [[ZYHEssenceViewController alloc] init];
    essenceVC.tabBarItem.image = [[UIImage imageNamed:@"tabBar_essence_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    essenceVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_essence_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    essenceVC.tabBarItem.title = @"精华";
    essenceVC.navigationItem.title = @"精华";
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:essenceVC]];

    //新帖界面
    ZYHNewViewController *newVC = [[ZYHNewViewController alloc] init];
    newVC.tabBarItem.image = [[UIImage imageNamed:@"tabBar_new_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_new_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newVC.tabBarItem.title = @"新帖";
    newVC.navigationItem.title = @"新帖";
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:newVC]];


    //发布界面
    ZYHPublishViewController *publishVC = [[ZYHPublishViewController alloc] init];
    publishVC.tabBarItem.image = [[UIImage imageNamed:@"tabBar_publish_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    publishVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_publish_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:publishVC];

    //关注界面
    ZYHFriendTrendViewController *friendTrendVC = [[ZYHFriendTrendViewController alloc] init];
    friendTrendVC.tabBarItem.image = [[UIImage imageNamed:@"tabBar_friendTrends_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    friendTrendVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    friendTrendVC.tabBarItem.title = @"关注";
    friendTrendVC.navigationItem.title = @"关注";
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:friendTrendVC]];


    //我界面
    ZYHMeViewController *meVC = [[ZYHMeViewController alloc] init];
    meVC.tabBarItem.image = [[UIImage imageNamed:@"tabBar_me_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_me_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meVC.tabBarItem.title = @"我";
    meVC.navigationItem.title = @"我";
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:meVC]];
}

@end
