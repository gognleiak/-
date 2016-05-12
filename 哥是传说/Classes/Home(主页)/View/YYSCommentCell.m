//
//  YYSCommentCell.m
//  哥是传说
//
//  Created by tarena on 16/4/8.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSCommentCell.h"
#import "YYSCommentModel.h"
@interface YYSCommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation YYSCommentCell
/**
 *  类方法
 *
 *  @return cell
 */
+(instancetype)commentCell
{
    YYSCommentCell *view = [[NSBundle mainBundle] loadNibNamed:@"YYSCommentCell" owner:nil options:nil].firstObject;
    return view;
}
/**
 *  重写setter方法
 */
-(void)setTopComment:(Top_Comments *)topComment
{
    _topComment = topComment;
    self.ding.userInteractionEnabled = !topComment.is_digg;
    if (topComment.is_digg) {
        [self.ding setTitleColor:YYSOutStandingColor forState:UIControlStateNormal];
    }
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:topComment.user_profile_image_url] placeholderImage:[UIImage imageNamed:@"placehold"]];
    self.nameLabel.text = topComment.user_name;
    if (topComment.digg_count == 0) {
        [self.ding setTitle:@"顶" forState:UIControlStateNormal];
    } else {
        [self.ding setTitle:[NSString numberToString:topComment.digg_count] forState:UIControlStateNormal];
    }
    //设置时间
    self.timeLabel.text = [[NSDate timeSpToString:topComment.create_time] creatFormtterString];
    
    self.contentLabel.text = topComment.text;

}
-(void)setRecentComment:(Recent_Comments *)recentComment
{
    _recentComment = recentComment;
    self.ding.userInteractionEnabled = !recentComment.is_digg;
    if (recentComment.is_digg) {
        [self.ding setTitleColor:YYSOutStandingColor forState:UIControlStateNormal];
    }
//    NSLog(@"%ld---%zd",recentComment.digg_count,self.isClickedDing);
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:recentComment.user_profile_image_url] placeholderImage:[UIImage imageNamed:@"placehold"]];
    self.nameLabel.text = recentComment.user_name;
    if (recentComment.digg_count == 0) {
        [self.ding setTitle:@"顶" forState:UIControlStateNormal];
    } else {
        [self.ding setTitle:[NSString numberToString:recentComment.digg_count] forState:UIControlStateNormal];
    }
    
    self.contentLabel.text = recentComment.text;
    

    //设置时间
    self.timeLabel.text = [[NSDate timeSpToString:recentComment.create_time] creatFormtterString];
}
- (void)awakeFromNib {
    // Initialization code
    self.iconImage.layer.cornerRadius = 25;
    self.iconImage.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)dingClick:(UIButton *)sender {
    if (self.topComment.digg_count == 0) {
        self.recentComment.digg_count = self.recentComment.digg_count + 1;
        [self.ding setTitle:[NSString numberToString:self.recentComment.digg_count] forState:UIControlStateNormal];
    } else {
        self.topComment.digg_count = self.topComment.digg_count + 1;
        [self.ding setTitle:[NSString numberToString:self.topComment.digg_count] forState:UIControlStateNormal];
    }
    
    [self.ding setTitleColor:YYSOutStandingColor forState:UIControlStateNormal];
    sender.userInteractionEnabled = NO;
    self.topComment.is_digg = YES;
    self.recentComment.is_digg = YES;
}

@end
