//
//  YYSCheckCell.m
//  哥是传说
//
//  Created by tarena on 16/4/11.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSCheckCell.h"
#import "YYSAllDataModel.h"
#import "YYSPictureView.h"
#import "YYSButton.h"



@interface YYSCheckCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet YYSButton *notfunny;
@property (weak, nonatomic) IBOutlet YYSButton *funny;

@property(nonatomic,strong)YYSPictureView *pictureV;

@property (weak, nonatomic) IBOutlet UIButton *jubao;

@end

@implementation YYSCheckCell
-(YYSPictureView *)pictureV
{
    if (_pictureV == nil) {
        _pictureV = [YYSPictureView pictureView];
        [self.contentView addSubview:_pictureV];
    }
    return _pictureV;
}


- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(Data2 *)data
{
    _data = data;
    self.nameLabel.text = data.group.text;
    self.pictureV.frame = data.pictureF;
    self.pictureV.yy_y -= YYSTopicCellTextMaxY - YYSTopicCellMargin;
    self.pictureV.yy_width -= 2 * YYSTopicCellMargin;
    self.pictureV.data = data;
    self.jubao.selected = NO;
    self.funny.selected = NO;
    self.notfunny.selected = NO;
    
}
- (IBAction)report:(UIButton *)sender {
    
    if (sender.selected) {
        [SVProgressHUD setMinimumDismissTimeInterval:0.25];
        [SVProgressHUD showErrorWithStatus:@"你已举报过了"];
        return ;
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"垃圾广告" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"淫秽色情" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"煽情骗顶" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action5 = [UIAlertAction actionWithTitle:@"抄袭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action6 = [UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *action7 = [UIAlertAction actionWithTitle:@"以前看过" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action4];
    [alert addAction:action5];
    [alert addAction:action7];
    [alert addAction:action6];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    sender.selected = YES;

}
- (IBAction)funny:(UIButton *)sender {
    
    if (sender.selected) {
        [SVProgressHUD setMinimumDismissTimeInterval:0.25];
        [SVProgressHUD showErrorWithStatus:@"你已投过票了"];
    } else {
        [SVProgressHUD setMinimumDismissTimeInterval:0.25];
        [SVProgressHUD showSuccessWithStatus:@"你投了赞成票"];
    }
    sender.selected = YES;
    self.notfunny.selected = YES;
}
- (IBAction)notfunny:(UIButton *)sender {
    
    if (sender.selected) {
        [SVProgressHUD setMinimumDismissTimeInterval:0.25];
        [SVProgressHUD showErrorWithStatus:@"你已投过票了"];
    } else {
        [SVProgressHUD setMinimumDismissTimeInterval:0.25];
        [SVProgressHUD showSuccessWithStatus:@"你投了反对票"];
    }
    sender.selected = YES;
    self.funny.selected = YES;
}
-(void)setFrame:(CGRect)frame
{
    static CGFloat margin = 10;

    frame.origin.x = margin;
    frame.size.width -= 2 * margin;
    frame.size.height -= margin;
    frame.origin.y += margin;

    [super setFrame:frame];
}

@end
