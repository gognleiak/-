//
//  YYSUserCell.m
//  哥是传说
//
//  Created by tarena on 16/4/11.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSUserCell.h"
#import "YYSAllDataModel.h"

@interface YYSUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *follows;
@property (weak, nonatomic) IBOutlet UILabel *unfollows;

@property (weak, nonatomic) IBOutlet UIButton *guanzhu;

@end

@implementation YYSUserCell

- (void)awakeFromNib {
    // Initialization code
    self.iconView.layer.cornerRadius = 20;
    self.iconView.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(Data2 *)data
{
    _data =data;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:data.group.user.avatar_url] placeholderImage:[UIImage imageNamed:@"placehold"]];
    self.nameLabel.text = data.group.user.name;
    self.follows.text = [NSString stringWithFormat:@"%@粉丝",[NSString numberToString:data.group.user.followers]];
    self.unfollows.text = [NSString stringWithFormat:@"%@关注",[NSString numberToString:data.group.user.ugc_count]];
    
    self.guanzhu.selected = data.isDing;
    
}
- (IBAction)guanzhuClick:(UIButton *)sender {
    self.guanzhu.selected = !self.guanzhu.selected;
    self.guanzhu.yy_x += self.guanzhu.yy_width + YYSTopicCellMargin;
    if (self.guanzhu.selected) {
        [self.guanzhu setTitle:@"已关注" forState:UIControlStateSelected];
        [self.guanzhu setTitleColor:YYSOutStandingColor forState:UIControlStateSelected];
        [self.guanzhu setBackgroundImage:[UIImage imageNamed:@"tabbar_background"] forState:UIControlStateSelected];
        self.unfollows.text = [NSString stringWithFormat:@"%@关注",[NSString numberToString:++self.data.group.user.ugc_count]];
    } else {
        self.unfollows.text = [NSString stringWithFormat:@"%@关注",[NSString numberToString:--self.data.group.user.ugc_count]];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.guanzhu.yy_x -= self.guanzhu.yy_width + YYSTopicCellMargin;
    }];
    self.data.isDing = !self.data.isDing;
}

@end
