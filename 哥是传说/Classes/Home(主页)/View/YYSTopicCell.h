//
//  YYSTopicCell.h
//  哥是传说
//
//  Created by tarena on 16/4/1.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Data2;
@class YYSVideoView;
@interface YYSTopicCell : UITableViewCell

@property(nonatomic,strong)Data2 *data;
@property (weak, nonatomic) IBOutlet UIButton *comment;
@property (weak, nonatomic) IBOutlet UIButton *guanzhu;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property(nonatomic,weak) YYSVideoView *videoV;
@end
