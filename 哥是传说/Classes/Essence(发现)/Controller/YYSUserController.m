//
//  YYSUserController.m
//  哥是传说
//
//  Created by tarena on 16/4/11.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSUserController.h"
#import "YYSTopicCell.h"
#import "YYSAllDataModel.h"
@interface YYSUserController ()

@end

@implementation YYSUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setUptable];
}
static NSString *ID = @"TopicCell";
-(void)setUptable
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYSTopicCell class]) bundle:nil] forCellReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYSTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    cell.textLabel.text = [self.data.data[indexPath.row] group].user.name;
//    cell.data = self.data;
    cell.data = self.data[indexPath.row];
    cell.guanzhu.hidden = NO;
    cell.bottomView.hidden = YES;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //隐藏底部工具条 高度变了
    return self.data[indexPath.row].cellHeight - YYSTopicCellBottomBarH;
}



@end
