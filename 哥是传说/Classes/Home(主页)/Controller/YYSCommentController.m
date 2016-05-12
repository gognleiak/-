//
//  YYSCommentController.m
//  哥是传说
//
//  Created by tarena on 16/4/8.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSCommentController.h"
#import "YYSAllDataModel.h"
#import "YYSCommentModel.h"
#import "YYSCommentCell.h"
#import "YYSVideoView.h"
#import "UMSocial.h"
@interface YYSCommentController ()
//评论模型
@property(nonatomic,strong)YYSCommentModel *commentModel;
@property(nonatomic,assign)NSInteger offset;

@property(nonatomic,strong)NSMutableArray *recentComments;

@property(nonatomic,strong)NSMutableDictionary *param;


@end

@implementation YYSCommentController

-(NSMutableArray *)recentComments
{
    if (_recentComments == nil) {
        _recentComments = [NSMutableArray array];
    }
    return _recentComments;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //自定义返回按钮以达到，回去时还能继续播放
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
    [self setTableView];
    //设置头部view
    [self setHeadView];
    
    //设置上拉刷新
    [self setFreshView];
    
}
//自定义按钮点击
-(void)back
{
    //回到最初偏移量
    [self .tableView setContentOffset:CGPointMake(0, 0)];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [UIView animateWithDuration:0.1 animations:^{
        self.tableView.contentOffset = CGPointMake(0, self.data.cellHeight - 44);
    }];
    if (self.data.group.origin_video == nil) {
        return;
    }
    /* 添加视频小窗口 */
    [self addUIWindow];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVideo) name:MPMoviePlayerWillEnterFullscreenNotification object:nil];
    
}

-(void)playVideo
{
//    window_.userInteractionEnabled = NO;
//    self.topicCell.videoV.playerController.controlStyle = MPMovieControlStyleNone;
//    [window_ makeKeyAndVisible];
}


//设置上拉刷新
-(void)setFreshView
{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}
//加载更多数据
-(void)loadMore
{
    self.offset += 20;
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"group_id"] = @(self.data.group.group_id);
    param[@"offset"] = @(self.offset);
    self.param = param;
    [NSObject GET:@"http://isub.snssdk.com/neihan/comments/" parameters:param progress:^(NSProgress *downloadProgress) {
        
    } completionHandler:^(NSDictionary *responseObj, NSError *error) {
        if (self.param != param) {
            [self.tableView.mj_footer endRefreshing];
            return ;
        }
//        [responseObj writeToFile:@"/Users/tarena/Desktop/abbb.plist" atomically:YES];
        _commentModel = [YYSCommentModel modelWithJSON:responseObj];
        [self.recentComments addObjectsFromArray:_commentModel.data.recent_comments];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    }];
}
/**
 *  初始化
 */
static NSString *ID = @"comment";

- (void)setTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYSCommentCell class]) bundle:nil] forCellReuseIdentifier:ID];
    // cell的高度设置
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
//    self.topicCell.videoV.playerController.controlStyle = MPMovieControlStyleNone;

}

-(void)dealloc
{
    self.topicCell.comment.userInteractionEnabled = YES;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/**
 *  设置头部view
 */
-(void)setHeadView
{
    UIView *view = [[UIView alloc] init];
    self.topicCell.frame = CGRectMake(0, 0, YYSScreenW, self.data.cellHeight);
    view.yy_width = YYSScreenW;
    [view addSubview:self.topicCell];
    view.height = self.data.cellHeight + YYSTopicCellMargin;
    self.tableView.tableHeaderView = view;
    
}
-(YYSCommentModel *)commentModel
{
    if (_commentModel == nil) {
        _commentModel = [[YYSCommentModel alloc] init];
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"group_id"] = @(self.data.group.group_id);
        param[@"offset"] = @(self.offset);
        self.param = param;
        [NSObject GET:@"http://isub.snssdk.com/neihan/comments/" parameters:param progress:^(NSProgress *downloadProgress) {
            
        } completionHandler:^(NSDictionary *responseObj, NSError *error) {
            if (self.param != param) {
                return ;
            }
            
            _commentModel = [YYSCommentModel modelWithJSON:responseObj];
            [self.recentComments addObjectsFromArray:_commentModel.data.recent_comments];
            [self.tableView reloadData];
        }];
    }
    return _commentModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self tableView:tableView viewForHeaderInSection:section];
    if (section == 0) {
        
        return self.commentModel.data.top_comments.count;
    } else {
        return self.recentComments.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = nil;
    YYSCommentCell *cell = [YYSCommentCell commentCell];
    if (indexPath.section == 0) {
        cell.topComment = self.commentModel.data.top_comments[indexPath.row];
    } else {
        cell.recentComment = self.recentComments[indexPath.row];
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UILabel *label = [[UILabel alloc] init];
//        label.yy_height = 30;
//        label.yy_x = 10;
        label.text = [NSString stringWithFormat:@"   热门评论（%ld）",self.commentModel.data.top_comments.count];
        label.textColor = [UIColor colorWithRed:252/255.0 green:109/255.0  blue:146/255.0 alpha:1];
        return label;
    } else {
        UILabel *label = [[UILabel alloc] init];
//        label.yy_height = 30;
        label.text = [NSString stringWithFormat:@"   新鲜评论（%ld）",self.recentComments.count];
        label.textColor = [UIColor colorWithRed:252/255.0 green:109/255.0  blue:146/255.0 alpha:1];
        return label;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
UIWindow *window_;
//窗口消失时
-(void)viewWillDisappear:(BOOL)animated
{
//    self.topicCell.videoV.playerController = nil;
    
    window_ = nil;
    [super viewWillDisappear:animated];
}
#pragma mark - 代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.data.group.origin_video == nil) {
        return;
    }
    if((NSInteger)self.tableView.contentOffset.y < (NSInteger)self.data.cellHeight - 44){
        self.topicCell.videoV.frame = self.data.videoF;
        self.topicCell.videoV.playerController.view.frame = self.topicCell.videoV.bounds;
        [self.topicCell  addSubview:self.topicCell.videoV];
        window_.hidden = YES;
    } else
    {
        self.topicCell.videoV.frame = window_.bounds;
        self.topicCell.videoV.playerController.view.frame = window_.bounds;
        
        [window_ addSubview:self.topicCell.videoV];
        window_.hidden = NO;
    }
}

/**
 *  添加小窗口
 */

-(void)addUIWindow
{
    //创建然后显示
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelNormal;
    CGFloat windowW = 200;
    CGFloat windowH = windowW * 9 / 16;
    window_.frame = CGRectMake(0, 64, windowW, windowH);
    self.topicCell.videoV.frame = window_.bounds;
    self.topicCell.videoV.playerController.view.frame = window_.bounds;
    [window_ addSubview:self.topicCell.videoV];
//    window_.userInteractionEnabled = NO;
    
    window_.hidden = NO;
}

@end
