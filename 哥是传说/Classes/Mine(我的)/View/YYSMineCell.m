//
//  YYSMineCell.m
//  哥是传说
//
//  Created by tarena on 16/4/11.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSMineCell.h"
#import "YYSMineModel.h"
@interface YYSMineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation YYSMineCell

- (void)awakeFromNib {
    // Initialization code
    self.image.layer.cornerRadius = self.image.yy_width * 0.5;
    self.image.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(YYSMineModel *)model
{
    _model = model;
    self.image.image = [UIImage imageNamed:model.imageName];
    self.content.text = model.text;
}
@end
