//
//  ZYHSubTagViewController.m
//  BuDeJie
//
//  Created by 若云 on 2018-12-17.
//  Copyright © 2018 GoodNight. All rights reserved.
//

#import "ZYHSubTagViewController.h"
#import <AFNetworking.h>
#import "ZYHSubTagItem.h"
#import <YYModel.h>
#import "ZYHSubTagCell.h"
#import <SVProgressHUD.h>

static NSString *const cellIdentifier = @"cell";

@interface ZYHSubTagViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSArray *subTag;
@property(nonatomic, weak) UITableView *tableView;
@property(nonatomic, weak) AFHTTPSessionManager *manager;
@end

@implementation ZYHSubTagViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYHSubTagCell class]) bundle:nil] forCellReuseIdentifier:cellIdentifier];
    [self loadData];
    self.title = @"推荐标签";

    //处理 cell 分割线 1.自定义分割线 2.系统属性
    //清空 tableView 分割线内边距 清空 cell 的约束边距
//    self.tableView.separatorInset = UIEdgeInsetsZero;
//    self.tableView.layoutMargins = UIEdgeInsetsZero;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:220 / 255.f green:220 / 255.f blue:220 / 255.f alpha:1];

    [SVProgressHUD showWithStatus:@"正在加载中....."];
}

- (void)loadData {
    __weak typeof(self) weakSelf = self;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://172.16.90.197:8080/api/setting" parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        weakSelf.subTag = [NSArray yy_modelArrayWithClass:[ZYHSubTagItem class] json:responseObject];
        NSLog(@"UI----%@", [NSThread currentThread]);
        ZYHLog(@"-----%@", responseObject);
        [weakSelf.tableView reloadData];
        ZYHLog(@"执行完毕");
        [SVProgressHUD dismiss];
    }    failure:^(NSURLSessionDataTask *task, NSError *error) {
        ZYHLog(@"失败");
        [SVProgressHUD dismiss];
    }];
    _manager = manager;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subTag.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYHSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    ZYHSubTagItem *subTagItem = self.subTag[indexPath.row];
    ZYHLog(@"%@", subTagItem);
    cell.item = subTagItem;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

//界面即将销毁
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 销毁指示器
    [SVProgressHUD dismiss];
    // 取消之前的请求
    [_manager.tasks makeObjectsPerformSelector:@selector(cancel)];
}

@end
