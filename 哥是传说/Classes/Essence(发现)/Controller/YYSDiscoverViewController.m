//
//  YYSDiscoverViewController.m
//  哥是传说
//
//  Created by tarena on 16/4/6.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSDiscoverViewController.h"
#import "YYSDiscoverViewModel.h"
#import "YYSDiscoverCell.h"
#import "YYSUserController.h"
#import "YYSAllDataModel.h"
@interface YYSDiscoverViewController ()

@property (nonatomic, strong) YYSDiscoverViewModel *discoverViewModel;
@property(nonatomic,strong)Rotate_Banner *banner;
@end

@implementation YYSDiscoverViewController

-(YYSDiscoverViewModel *)discoverViewModel
{
    if (_discoverViewModel == nil) {
        _discoverViewModel = [[YYSDiscoverViewModel alloc] init];
        [NSObject GET:@"http://ic.snssdk.com/2/essay/discovery/v3/?channel=App%20Store&device_platform=iphone"
           parameters:nil progress:^(NSProgress *downloadProgress) {
               
           } completionHandler:^(id responseObj, NSError *error) {
//               [responseObj writeToFile:@"/Users/tarena/Desktop/yuyou.plist" atomically:YES];
//               NSLog(@"%@",responseObj);
               [_discoverViewModel.datas addObjectsFromArray:[YYSDiscoverModel modelWithJSON:responseObj].data.categories.category_list];
               //拿到rotate_banner
               self.banner = [YYSDiscoverModel modelWithJSON:responseObj].data.rotate_banner;
               
               //添加titleView  滑动图片
               [self addTitleView];
               //刷新表格
               [self.tableView reloadData];
           }];
    }
    return _discoverViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化table
    [self setTableView];
}
-(void)viewWillAppear:(BOOL)animated
{
    //初始化nav
    [self setupNav];
}
#pragma mark - 初始化
//初始化nav
-(void)setupNav
{
    self.navigationItem.title = @"发现";
    self.view.backgroundColor = YYSGlobalColor;
}
//初始化table
static NSString *ID = @"cell";
-(void)setTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYSDiscoverCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - 添加标题控件
-(void)addTitleView
{
    YYPageView *view = [YYPageView pageView];
    if (self.banner.banners.firstObject.banner_url.url_list.firstObject.url == nil) {
        return;
    }
    view.imageNames = [NSMutableArray arrayWithObject:self.banner.banners.firstObject.banner_url.url_list.firstObject.url];
    view.frame = CGRectMake(0, 0, YYSScreenW, self.banner.banners.firstObject.banner_url.height * YYSScreenW / self.banner.banners.firstObject.banner_url.width);
    self.tableView.tableHeaderView = view;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"%ld",self.discoverViewModel.datas.count);
    return self.discoverViewModel.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYSDiscoverCell *cell = [YYSDiscoverCell discoverCell];
//    cell.textLabel.text = [self.discoverViewModel dataForIndex:indexPath.row].name;
//    cell.detailTextLabel.text = [self.discoverViewModel dataForIndex:indexPath.row].placeholder;
    cell.CategoryModel = self.discoverViewModel.datas[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 121;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tableView.userInteractionEnabled = NO;
    YYSUserController *user = [[YYSUserController alloc] init];
    [SVProgressHUD showWithStatus:@"加载中"];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"category_id"] = self.discoverViewModel.datas[indexPath.row].big_category_id == 0 ? @(self.discoverViewModel.datas[indexPath.row].big_category_id) : @(self.discoverViewModel.datas[indexPath.row].ID);
   
    [NSObject GET:@"http://ic.snssdk.com/neihan/stream/category/data/v2/?tag=joke&iid=3987801940&os_version=9.3&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=CF24EF72-028C-49FE-A695-FC51AE0216C1&vid=B2051E6A-222F-4756-A5EA-B60629367C26&openudid=6071453510867a67646685d572f6acdc46263c85&device_type=iPhone%205S&version_code=5.0.1&ac=WIFI&screen_width=640&device_id=13188258237&aid=7&count=30&level=6&message_cursor=0&min_time=1460345379&mpic=1" parameters:param progress:^(NSProgress *downloadProgress) {
        
    } completionHandler:^(id responseObj, NSError *error) {
//        [responseObj writeToFile:@"/Users/tarena/Desktop/abc.plist" atomically:YES];
        self.tableView.userInteractionEnabled = YES;
        user.data = [YYSAllDataModel modelWithJSON:responseObj].data.data;
        [SVProgressHUD dismiss];
        [self.navigationController pushViewController:user animated:YES];
    }];
    
}

@end
