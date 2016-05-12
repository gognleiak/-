//
//  YYSButton.m
//  哥是传说
//
//  Created by tarena on 16/4/12.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSButton.h"

@implementation YYSButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews
{
    [super layoutSubviews];
    //设置图片frame
    self.imageView.yy_x = 0;
    self.imageView.yy_y = 0;
    self.imageView.yy_width = self.yy_width;
    self.imageView.yy_height = self.imageView.yy_width;
    
    //设置label的frame
    self.titleLabel.yy_x = 6;
    self.titleLabel.yy_y = self.imageView.yy_width;
    self.titleLabel.yy_width = self.yy_width;
    self.titleLabel.yy_height = self.yy_height - self.imageView.yy_height;
}

@end
