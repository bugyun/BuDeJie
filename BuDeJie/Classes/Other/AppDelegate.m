//
//  AppDelegate.m
//  BuDeJie
//
//  Created by 若云 on 2018/12/10.
//  Copyright © 2018年 GoodNight. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYHHomeTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//程序启动的时候就会调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ZYHHomeTabBarController *uiTabBarVC = [[ZYHHomeTabBarController alloc] init];
    self.window.rootViewController = uiTabBarVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}
@end
