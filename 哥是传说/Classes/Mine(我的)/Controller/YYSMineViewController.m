//
//  YYSMineViewController.m
//  哥是传说
//
//  Created by tarena on 16/4/11.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSMineViewController.h"
#import "YYSMineCell.h"
#import "YYSMineModel.h"
#import "YYSAttentionController.h"
#import "YYSUserController.h"
@interface YYSMineViewController ()

@property(nonatomic,strong)NSArray<YYSMineModel *> *models;


@end

@implementation YYSMineViewController
static NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setTable];
    
}

-(NSArray<YYSMineModel *> *)models
{
    if (_models == nil) {
        YYSMineModel *model = [[YYSMineModel alloc] init];
        model.imageName = @"message";
        model.text = @"关于版本";
        
        YYSMineModel *model1 = [[YYSMineModel alloc] init];
        model1.imageName = @"hudong";
        model1.text = @"系统消息";
        
        YYSMineModel *model2 = [[YYSMineModel alloc] init];
        model2.imageName = @"guanzhu";
        model2.text = @"集锦关注";
        _models = @[model2,model1,model];
    }
    return _models;
}
-(void)setTable
{
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YYSMineCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:212/255.0 green:209/255.0 blue:196/255.0 alpha:1];
    self.navigationItem.title = @"我的";
    self.view.backgroundColor = YYSGlobalColor;

    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYSMineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.model = self.models[indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        YYSAttentionController *attention = [[YYSAttentionController alloc] init];
        [self.navigationController pushViewController:attention animated:YES];
    } else if (indexPath.row == 1) {
        [SVProgressHUD setMinimumDismissTimeInterval:0.5];
        [SVProgressHUD showInfoWithStatus:@"暂无"];
    } else if (indexPath.row == 2) {
        [SVProgressHUD setMinimumDismissTimeInterval:0.5];
        [SVProgressHUD showInfoWithStatus:@"1.0版本，更多功能将在下个版本更新，敬请期待"];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
