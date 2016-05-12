//
//  YYSDiscoverCell.m
//  哥是传说
//
//  Created by tarena on 16/4/7.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSDiscoverCell.h"
#import "YYSDiscoverModel.h"
@interface YYSDiscoverCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@property (weak, nonatomic) IBOutlet UILabel *subscribeCount;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;
@property (weak, nonatomic) IBOutlet UILabel *totalUpdateCount;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *subscribeBtn;

@end
@implementation YYSDiscoverCell

+(instancetype)discoverCell
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YYSDiscoverCell class]) owner:nil options:nil].firstObject;
}
- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
//重写模型getter方法，以赋值
-(void)setCategoryModel:(Category_List *)CategoryModel
{
    _CategoryModel = CategoryModel;
    if (CategoryModel.isDingYue) {
        self.subscribeBtn.backgroundColor = YYSOutStandingColor;
    } else {
        self.subscribeBtn.backgroundColor = [UIColor whiteColor];
    }
    //设置图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:CategoryModel.small_icon_url] placeholderImage:[UIImage imageNamed:@"placehold"]];
    
    //设置文本
    self.nameLabel.text = CategoryModel.name;
    self.introLabel.text = CategoryModel.intro;
    self.subscribeCount.text = [NSString stringWithFormat:@"%@订阅",[NSString numberToString:CategoryModel.subscribe_count]];
    self.subscribeCount.textColor = YYSOutStandingColor;
    self.totalUpdateCount.text = [NSString stringWithFormat:@"总帖数%@",[NSString numberToString:CategoryModel.total_updates]];
    self.totalUpdateCount.textColor = YYSOutStandingColor;
    
}
//-(void)setFrame:(CGRect)frame
//{
//    static CGFloat margin = 10;
//    
//    frame.origin.x = margin;
//    frame.size.width -= 2 * margin;
//    frame.size.height -= margin;
//    frame.origin.y += margin;
//    
//    [super setFrame:frame];
//}
- (IBAction)clickSubscribe:(UIButton *)sender {
    self.CategoryModel.isDingYue = !self.CategoryModel.isDingYue;
    if (self.CategoryModel.isDingYue) {
        sender.backgroundColor = YYSOutStandingColor;
    } else {
        sender.backgroundColor = [UIColor whiteColor];
    }
}

@end
