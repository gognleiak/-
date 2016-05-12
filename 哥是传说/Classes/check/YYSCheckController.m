//
//  YYSCheckController.m
//  哥是传说
//
//  Created by tarena on 16/4/11.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSCheckController.h"
#import "YYSAllDataModel.h"
#import "YYSCheckCell.h"
@interface YYSCheckController ()

//@property(nonatomic,strong)Data1 *datas;
@property(nonatomic,strong)NSMutableArray <Data2 *>*datas;

@end

@implementation YYSCheckController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self datas];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setTable];
    [self setRefresh];
}
-(void)setRefresh
{
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDatas)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewDatas)];
    
}
-(void)loadNewDatas
{
    [self.tableView.mj_footer endRefreshing];
   
    ///neihan/stream/mix/v1/
    [NSObject GET:@"http://ic.snssdk.com/2/essay/zone/ugc/recent/v1/?iid=3987801940&os_version=9.3&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=CF24EF72-028C-49FE-A695-FC51AE0216C1&vid=B2051E6A-222F-4756-A5EA-B60629367C26&openudid=6071453510867a67646685d572f6acdc46263c85&device_type=iPhone%205S&version_code=5.0.1&ac=WIFI&screen_width=640&device_id=13188258237&aid=7&app_name=joke_essay&min_create_time=0&tag=joke" parameters:nil progress:^(NSProgress *downloadProgress) {
        
    } completionHandler:^(NSDictionary *responseObj, NSError *error) {
        
        
        
        NSMutableArray *arr =  [NSMutableArray arrayWithArray:[Data1 modelWithJSON:responseObj].data];
        NSMutableArray *temp = [NSMutableArray array];
        for (Data2 *obj1 in arr) {
            for (Data2 *obj2 in self.datas) {
                if ([obj1.group.text isEqualToString:obj2.group.text]) {
//                    [arr removeObject:obj1];
                    [temp addObject:obj1];
                }
            }
        }
        [arr removeObjectsInArray:temp];
        [self.datas addObjectsFromArray:arr];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

//- (NSArray *)arrayWithMemberIsOnly:(NSArray *)array
//{
//    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
//    for (unsigned i = 0; i < [array count]; i++) {
//        @autoreleasepool {
//            if ([categoryArray containsObject:[array objectAtIndex:i]] == NO) {
//                [categoryArray addObject:[array objectAtIndex:i]];
//            }
//        }
//    }
//    return categoryArray;
//}

static NSString *ID = @"check";
-(void)setTable
{
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYSCheckCell class]) bundle:nil] forCellReuseIdentifier:ID];
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = YYSGlobalColor;
    self.navigationItem.title = @"审核";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(edit)];
    self.navigationItem.rightBarButtonItem = backItem;
}

-(void)edit
{
    [SVProgressHUD showInfoWithStatus:@"我们的投稿需要网友们的审核，才能通过。我们的目标是不求最好，也不求更好，只求让大多数用户满意"];
}
-(NSMutableArray<Data2 *> *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"%ld",self.datas.data.count);
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYSCheckCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // Configure the cell...
    cell.data = self.datas[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.datas[indexPath.row].cellHeight;
}



@end
