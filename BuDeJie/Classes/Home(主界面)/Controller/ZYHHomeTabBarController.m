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
#import "UIImage+Image.h"
#import "ZYHTabBar.h"
#import "ZYHNavigationController.h"

/**
 * 谁的事情谁管理
 */
@interface ZYHHomeTabBarController ()

@end

@implementation ZYHHomeTabBarController

#warning TODO:要做的事情

/**
 *  什么时候调用 当程序一启动的时候就会调用
     作用: 将当前类加载进内存, 放在代码区
     只会调用一次
 */
+ (void)load {
    [super load];
    NSLog(@"%s", __func__);
    //获取哪个类的 UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[ZYHHomeTabBarController class]]];
    //设置富文本
    NSMutableDictionary *dictionarySelected = [NSMutableDictionary dictionary];
    dictionarySelected[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:dictionarySelected forState:UIControlStateSelected];
    NSMutableDictionary *dictionaryNormal = [NSMutableDictionary dictionary];
    dictionaryNormal[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    //设置字体大小:只有设置正常状态下,才会有效果
    [item setTitleTextAttributes:dictionaryNormal forState:UIControlStateNormal];
}

/**
 * 什么时候调用 当第一次初始这个类的时候调用,如果当这个类有子类会调用多次
   作用 初始化这个类
 */
//注意:可能会调用多次
+ (void)initialize {
    [super initialize];
    if (self == [ZYHHomeTabBarController class]) {
        NSLog(@"%s", __func__);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    NSLog(@"%@", self.tabBar);
    [self setupAllChildViewController];
    NSLog(@"%@", self.tabBar);
    [self setupAllTitleButton];
    [self setupTabBar];
}

//在 view 即将要显示的时候,才对 view 进行绘制. 调用 layoutSubviews 方法
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
    NSLog(@"%@", self.tabBar.subviews);

}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
    NSLog(@"%@", self.tabBar.subviews);

}


//自定义 tabBar
- (void)setupTabBar {
    ZYHTabBar *tabBar = [[ZYHTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    NSLog(@"%@", self.tabBar.subviews);
}

//初始化界面
- (void)setupAllChildViewController {
    //精华界面
    ZYHEssenceViewController *essenceVC = [[ZYHEssenceViewController alloc] init];
    essenceVC.tabBarItem.image = [UIImage imageWithOriginalModeNamed:@"tabBar_essence_icon"];
    essenceVC.tabBarItem.selectedImage = [UIImage imageWithOriginalModeNamed:@"tabBar_essence_click_icon"];
    essenceVC.tabBarItem.title = @"精华";
    [self addChildViewController:[[ZYHNavigationController alloc] initWithRootViewController:essenceVC]];

    //新帖界面
    ZYHNewViewController *newVC = [[ZYHNewViewController alloc] init];
    newVC.tabBarItem.image = [UIImage imageWithOriginalModeNamed:@"tabBar_new_icon"];
    newVC.tabBarItem.selectedImage = [UIImage imageWithOriginalModeNamed:@"tabBar_new_click_icon"];
    newVC.tabBarItem.title = @"新帖";
    [self addChildViewController:[[ZYHNavigationController alloc] initWithRootViewController:newVC]];


//    //发布界面
//    ZYHPublishViewController *publishVC = [[ZYHPublishViewController alloc] init];
//    publishVC.tabBarItem.image = [UIImage imageWithOriginalModeNamed:@"tabBar_publish_icon"];
//    publishVC.tabBarItem.selectedImage = [UIImage imageWithOriginalModeNamed:@"tabBar_publish_click_icon"];
//    [self addChildViewController:publishVC];
//    publishVC.tabBarItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);


    //关注界面
    ZYHFriendTrendViewController *friendTrendVC = [[ZYHFriendTrendViewController alloc] init];
    friendTrendVC.tabBarItem.image = [UIImage imageWithOriginalModeNamed:@"tabBar_friendTrends_icon"];
    friendTrendVC.tabBarItem.selectedImage = [UIImage imageWithOriginalModeNamed:@"tabBar_friendTrends_click_icon"];
    friendTrendVC.tabBarItem.title = @"关注";
    [self addChildViewController:[[ZYHNavigationController alloc] initWithRootViewController:friendTrendVC]];


    //我界面
    ZYHMeViewController *meVC = [[ZYHMeViewController alloc] init];
    meVC.tabBarItem.image = [UIImage imageWithOriginalModeNamed:@"tabBar_me_icon"];
    meVC.tabBarItem.selectedImage = [UIImage imageWithOriginalModeNamed:@"tabBar_me_click_icon"];
    meVC.tabBarItem.title = @"我";
    [self addChildViewController:[[ZYHNavigationController alloc] initWithRootViewController:meVC]];
}

/**
 * 问题:
 * 1.选中的图片被渲染 -> ios7 之后默认 tabbar 上按钮图片都会被渲染 1.修改图片 2.通过代码
 * 2.选中标题颜色:黑色  标题字体大
 * 3.发布按钮显示不出来
 */
//设置 tabBar 上所有按钮内容
- (void)setupAllTitleButton {
//    UINavigationController *nav0 = self.childViewControllers[0];
//    UINavigationController *nav1 = self.childViewControllers[1];
//    UINavigationController *nav2 = self.childViewControllers[2];
//    UINavigationController *nav3 = self.childViewControllers[3];
}

@end
