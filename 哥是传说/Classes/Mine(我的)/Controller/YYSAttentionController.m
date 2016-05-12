//
//  YYSAttentionController.m
//  哥是传说
//
//  Created by tarena on 16/4/11.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSAttentionController.h"
#import "YYSUserCell.h"

#import "YYSAllDataViewModel.h"
@interface YYSAttentionController ()

/**
 *  Data2模型
 */
//@property (nonatomic,strong) NSMutableArray <Data2 *>*datas;
@property(nonatomic,strong)YYSAllDataViewModel *dataModel;
@property(nonatomic,strong)NSMutableDictionary *params;

@end

@implementation YYSAttentionController
#pragma mark - 懒加载
-(YYSAllDataViewModel *)dataModel
{
    if (_dataModel == nil) {
        _dataModel = [[YYSAllDataViewModel alloc] init];
    }
    return _dataModel;
}

-(NSMutableDictionary *)params
{
    if (_params == nil) {
        _params = [NSMutableDictionary dictionary];
    }
    return _params;
}

/**
 *  跳转回来刷新表格
 */
-(void)viewWillAppear:(BOOL)animated
{
    
    [self.tableView reloadData];
}
-(void)viewDidAppear:(BOOL)animated{
    
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableView
    [self setTableView];
    
    //设置刷新控件
    [self setRefresh];
    
}

-(void)setRefresh
{
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDatas)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDatas)];
    
}

-(void)loadNewDatas
{
    [self.tableView.mj_footer endRefreshing];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"content_type"] = @(-201);
    //    NSLog(@"%zd",self.topicType);
    param[@"aid"] = @7;
    param[@"count"] = @30;
    param[@"essence"] = @1;
    param[@"message_cursor"] = @0;
    param[@"mpic"] = @1;
    self.params = param;
    ///neihan/stream/mix/v1/
    [NSObject GET:@"http://ic.snssdk.com/neihan/stream/mix/v1/" parameters:param progress:^(NSProgress *downloadProgress) {
        
    } completionHandler:^(NSDictionary *responseObj, NSError *error) {
        YYSAllDataModel *topicModel = [YYSAllDataModel modelWithJSON:responseObj];
        //        [responseObj writeToFile:@"/Users/tarena/Desktop/abbc.plist" atomically:YES];
        if (self.params != param) {
            [self.tableView.mj_header endRefreshing];
            return ;
        }
        [self.dataModel.datas removeAllObjects];
        [self.dataModel.datas addObjectsFromArray:topicModel.data.data];
        static int i = 0;
        if (self.dataModel.datas.count == 0 && i < 5) {
            i++;
            [self.tableView.mj_header endRefreshing];
            [self loadNewDatas];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

-(void)loadMoreDatas
{
    [self.tableView.mj_header endRefreshing];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"content_type"] = @(-201);
    param[@"aid"] = @7;
    param[@"count"] = @30;
    param[@"message_cursor"] = @0;
    param[@"mpic"] = @1;
    self.params = param;
    [NSObject GET:@"http://ic.snssdk.com/neihan/stream/mix/v1/" parameters:param progress:^(NSProgress *downloadProgress) {
        
    } completionHandler:^(id responseObj, NSError *error) {
        YYSAllDataModel *topicModel = [YYSAllDataModel modelWithJSON:responseObj];
        //        _datas = topicModel.data.data;
        if (self.params != param) {
            [self.tableView.mj_footer endRefreshing];
            return ;
        }
        [self.dataModel.datas addObjectsFromArray:topicModel.data.data];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
}
static NSString *ID = @"user";
-(void)setTableView
{
    CGFloat bottom = self.tabBarController.tabBar.yy_height - YYSTopicCellMargin;
    CGFloat top = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, -bottom, 0);
    self.view.backgroundColor = YYSGlobalColor;
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYSUserCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataModel.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYSUserCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.data = [self.dataModel dataForIndex:indexPath.row];
    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Data2 *data = [self.dataModel dataForIndex:indexPath.row];
//    return data.cellHeight;
//}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
