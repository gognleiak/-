//
//  YYSCommentController.h
//  哥是传说
//
//  Created by tarena on 16/4/8.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYSTopicCell.h"
@class Data2;
@interface YYSCommentController : UITableViewController

@property(nonatomic,strong)Data2 *data;

@property(nonatomic,strong)YYSTopicCell *topicCell;
@end
