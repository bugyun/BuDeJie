//
//  ZYHTabBar.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-11.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHTabBar.h"

@interface ZYHTabBar ()
@property(nonatomic, weak) UIButton *plusButton;
@end

@implementation ZYHTabBar

- (UIButton *)plusButton {
    if (!_plusButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [button sizeToFit];
        [self addSubview:button];
        _plusButton = button;
    }
    return _plusButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.items.count + 1;
    CGFloat btnW = self.frame.size.width / count;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnX = 0;

    NSLog(@"%@", self.subviews);
    NSInteger i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            //NSLog(@"%@", tabBarButton);
            if (i == 0) {
                btnH = tabBarButton.frame.size.height;
            }
            if (i == 2) {
                i += 1;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            i++;
        }
    }
    //设置加号按钮
    self.plusButton.center = CGPointMake(self.frame.size.width * 0.5f, btnH * 0.5f);
}

@end
