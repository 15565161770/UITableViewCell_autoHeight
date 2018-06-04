//
//  ViewController.m
//  TWTableViewDemo
//
//  Created by 仝兴伟 on 2018/6/4.
//  Copyright © 2018年 TW. All rights reserved.
//  一个自适应高度的自定义cell 这是一张图片(如果多张图片怎么办)

#import "ViewController.h"
#import "TWStatus.h"
#import "TWStatusFrame.h"
#import "TWStatusCell.h"
static NSString *ID = @"Cell";
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
/** 保存statusFrame模型的数组 */
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation ViewController

-(NSArray *)statusFrames {
    if (!_statusFrames) {
        _statusFrames = [TWStatusFrame statusFrames];
    }
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化tableview
    [self addTableview];
    NSLog(@"-- %lu", (unsigned long)self.statusFrames.count);
}

- (void)addTableview {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[TWStatusCell class] forCellReuseIdentifier:ID];
}

#pragma mark -- delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TWStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.statusFrame = self.statusFrames[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TWStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    NSLog(@"%f", statusFrame.cellHeight);
    return statusFrame.cellHeight;
}


@end
