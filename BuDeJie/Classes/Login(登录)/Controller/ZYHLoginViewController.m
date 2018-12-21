//
//  ZYHLoginViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-18.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHLoginViewController.h"

@interface ZYHLoginViewController ()

@end

@implementation ZYHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ZYHScreenW, ZYHScreenH)];
    backImageView.image = [UIImage imageNamed:@"login_register_background"];
    [self.view addSubview:backImageView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    ZYHFunc;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    ZYHFunc;

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
