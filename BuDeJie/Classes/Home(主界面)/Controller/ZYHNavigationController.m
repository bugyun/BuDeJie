//
//  ZYHNavigationController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-13.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHNavigationController.h"

@interface ZYHNavigationController () <UIGestureRecognizerDelegate>

//@property(nonatomic, strong) id <UIGestureRecognizerDelegate> popGestureRecognizerDelegate;

@end

@implementation ZYHNavigationController


+ (void)load {
    [super load];
//    //设置导航条标题 => UINavigationBar
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[ZYHNavigationController class]]];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    //设置导航条背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.interactivePopGestureRecognizer.delegate = self;
//    self.interactivePopGestureRecognizer.enabled = YES;
    ZYHLog(@"%@", self.interactivePopGestureRecognizer);
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;//禁止之前的手势
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //统一设置返回按钮
    if (self.viewControllers.count > 0) {
        //恢复滑动返回功能 -> 分析:把系统的返回按钮覆盖 -> 1.手势失效
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        //    self.navigationItem.leftBarButtonItem.title = @"返回";
        //    self.navigationItem.leftBarButtonItem.image = [UIImage imageWithOriginalModeNamed:@"navigationButtonReturn"];
    }
    [super pushViewController:viewController animated:animated];
}


- (void)back:(UIButton *)button {
    ZYHFunc;
    [self popViewControllerAnimated:YES];
}


@end
