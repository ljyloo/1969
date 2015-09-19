//
//  ShowsTableViewController.m
//  Thousands
//
//  Created by SeaHub on 15/9/9.
//  Copyright (c) 2015年 S3Develop. All rights reserved.
//

#import "ShowsTableViewController.h"
#import "ShowsTableViewCell.h"
#import <CommonCrypto/CommonDigest.h>

@interface ShowsTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ShowsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self constructRefreshButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Construct && Layout
//下拉刷新按钮构造
-(void)constructRefreshButton{
    UIRefreshControl *refreshControlButton = [[UIRefreshControl alloc]init];
    refreshControlButton.tintColor = [UIColor grayColor];
    [refreshControlButton addTarget:self action:@selector(getDataAndRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControlButton];
    
    [refreshControlButton beginRefreshing];
    [self getDataAndRefresh:refreshControlButton];
}

#pragma mark - Button Actions && Methods
//下拉刷新动作 - 从网络抓取数据 - 放入数组 - 更新界面 - 停止转动
-(void)getDataAndRefresh:(UIRefreshControl *)control{
    //此时应从网络getData并放入数组
    [self.tableView reloadData];
    [control endRefreshing];
}



#pragma mark - Delegate Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"ShowsTableCell";
    ShowsTableViewCell *cell = (ShowsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ShowsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}





@end
