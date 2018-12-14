//
//  ZYHADViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-13.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHADViewController.h"
#import "ZYHHomeTabBarController.h"
#import <AFNetworking.h>
#import "ZYHADModel.h"
#import <YYModel.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface ZYHADViewController ()

@property(nonatomic, weak) UIImageView *uiImageView;
@property(nonatomic, weak) NSTimer *timer;
@property(nonatomic, weak) UIButton *button;
@end

@implementation ZYHADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLaunchImage];
    [self loadAdData];
    [self countDown];
}

- (void)countDown {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
}

- (void)timeChange:(id)timeChange {
    static int i = 4;
    if (i == 0) {
        [self go];//销毁界面
    }
    i--;
    [_button setTitle:[NSString stringWithFormat:@"跳过(%d)", i] forState:UIControlStateNormal];
}

#pragma mark - 加载广告数据

- (void)loadAdData {
    [_uiImageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic1.win4000.com/mobile/2018-10-08/5bbb0343355a0.jpg"]
                    placeholderImage:[UIImage imageNamed:@"LaunchImage"]];
    NSString *url = @"";
    if (url == nil) {
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //请求数据 -> 解析数据 -> 展示数据
        ZYHADModel *model = [ZYHADModel yy_modelWithJSON:responseObject];

    }    failure:^(NSURLSessionDataTask *task, NSError *error) {

    }];
}

- (void)go {
    [self.timer invalidate]; //干掉定时器
    ZYHHomeTabBarController *zyhHomeTabBarController = [[ZYHHomeTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = zyhHomeTabBarController;
}

- (void)setupLaunchImage {
    UIImageView *uiImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ZYHScreenW, ZYHScreenH)];
    uiImageView.image = [UIImage imageNamed:@"LaunchImage"];
    [self.view addSubview:uiImageView];
    _uiImageView = uiImageView;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"跳过(4)" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    button.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    CGSize cgSize = [button sizeThatFits:CGSizeZero];
    button.frame = CGRectMake(ZYHScreenW - cgSize.width - 10, 25, cgSize.width, cgSize.height);
    [button addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    _button = button;

    NSInteger screenH = (NSInteger) ZYHScreenH;
    switch (screenH) {
        case 736://6p
            break;
        case 667://6
            break;
        case 568://5
            break;
        case 480://4
            break;
        default:
            break;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    ZYHFunc;
}

- (void)dealloc {
    ZYHLog(@"ZYHADViewController 销毁");
}

@end
