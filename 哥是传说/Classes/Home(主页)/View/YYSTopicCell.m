//
//  YYSTopicCell.m
//  哥是传说
//
//  Created by tarena on 16/4/1.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSTopicCell.h"
#import "YYSAllDataModel.h"
#import "YYSPictureView.h"
#import "YYSVideoView.h"
#import "YYSCommentController.h"
#import "UMSocial.h"
@interface YYSTopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UITextField *typeText;
@property (weak, nonatomic) IBOutlet UILabel *contentText;

@property (weak, nonatomic) IBOutlet UIButton *cai;

@property (weak, nonatomic) IBOutlet UIButton *share;

@property (weak, nonatomic) IBOutlet UIButton *ding;

@property(nonatomic,weak)YYSPictureView *pictureV;
@end

@implementation YYSTopicCell

-(YYSPictureView *)pictureV
{
    if (_pictureV == nil) {
        YYSPictureView *view = [YYSPictureView pictureView];
        _pictureV = view;
        [self.contentView addSubview:view];
    }
    return _pictureV;
}

-(YYSVideoView *)videoV
{
    if (_videoV == nil) {
        _videoV = [YYSVideoView videoView];
        [self.contentView addSubview:_videoV];
    }
    return _videoV;
}
/**
 *  根据模型设置数据
 *
 *  @param data 模型
 */
-(void)setData:(Data2 *)data
{
    _data = data;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:data.group.user.avatar_url] placeholderImage:[UIImage imageNamed:@"placehold"]];
    self.userName.text = data.group.user.name;
    self.typeText.text = data.group.category_name;
    self.contentText.text = data.group.text;
    [self.ding setTitle:[NSString numberToString:data.group.digg_count] forState:UIControlStateNormal];
    [self.cai setTitle:[NSString numberToString:data.group.bury_count] forState:UIControlStateNormal];
    [self.comment setTitle:[NSString numberToString:data.group.comment_count] forState:UIControlStateNormal];
    [self.share setTitle:[NSString numberToString:data.group.share_count] forState:UIControlStateNormal];
    self.ding.selected = self.data.isDing;
    self.cai.selected = self.data.isCai;

//    NSLog(@"%ld----%ld",data.group.origin_video.width,data.group.origin_video.height);
    if ((data.group.large_image != nil || data.group.large_image_list.count != 0) && data.group.origin_video == nil) {
        self.videoV.hidden = YES;
        self.pictureV.hidden = NO;
        self.pictureV.frame = data.pictureF;
        self.pictureV.data = data;
    } else if (data.group.origin_video != nil) {
//        self.videoV.frame = data.videoF;
//        self.videoV.playerController.view.frame = self.videoV.bounds;
//        [self addSubview:self.videoV];
        self.pictureV.hidden = YES;
        self.videoV.hidden = NO;
        self.videoV.frame = data.videoF;
//        NSLog(@"%@",NSStringFromCGRect(data.videoF));
        self.videoV.data = data;
    } else {
        self.pictureV.hidden = YES;
        self.videoV.hidden = YES;
    }
    
}



- (void)awakeFromNib {
    // Initialization code
    //设置图片圆角
    self.iconImage.layer.cornerRadius = self.iconImage.yy_width * 0.5;
    self.iconImage.clipsToBounds = YES;
//    self.userInteractionEnabled = NO;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
#pragma mark - 点击了顶
- (IBAction)dingClick:(UIButton *)sender {
    if (self.cai.selected) {
        [SVProgressHUD setMinimumDismissTimeInterval:0.25];
        [SVProgressHUD showErrorWithStatus:@"你已经踩过了"];
        return ;
    }
    sender.selected = !sender.selected;
    [sender setTitleColor:YYSOutStandingColor forState:UIControlStateSelected];
    if (sender.selected) {
        [sender setTitle:[NSString numberToString:self.data.group.digg_count + 1] forState:UIControlStateSelected];
    }
    self.data.isDing = !self.data.isDing;
}
#pragma mark - 点击了cai
- (IBAction)caiClick:(UIButton *)sender {
    if (self.ding.selected) {
        [SVProgressHUD setMinimumDismissTimeInterval:0.25];
        [SVProgressHUD showErrorWithStatus:@"你已经顶过了"];
        return ;
    }
    sender.selected = !sender.selected;
    [sender setTitleColor:YYSOutStandingColor forState:UIControlStateSelected];
    if (sender.selected) {
        [sender setTitle:[NSString numberToString:self.data.group.bury_count + 1] forState:UIControlStateSelected];
    }
    self.data.isCai = !self.data.isCai;
}
#pragma mark - 点击了评论
- (IBAction)commentClick:(UIButton *)sender {
    YYSCommentController *commentV = [[YYSCommentController alloc] init];
    commentV.data = self.data;
    commentV.topicCell = self;
    sender.userInteractionEnabled = NO;
    commentV.hidesBottomBarWhenPushed = YES;
    [[UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers.firstObject pushViewController:commentV animated:YES];
}
#pragma mark - 点击了分享
- (IBAction)shareClick:(UIButton *)sender {
    UIImage *image = self.iconImage.image;
    NSString *shareText = self.data.group.text;
    NSString *url = self.data.group.share_url;
    NSString *title = self.data.group.status_desc;
    [UMSocialSnsService presentSnsIconSheetView:[UIApplication sharedApplication].keyWindow.rootViewController
                                         appKey:@"5708bd6367e58ef8e20007a8"
                                      shareText:shareText
                                     shareImage:image
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite,nil]
                                       delegate:nil];
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
- (IBAction)guanzhuClick:(id)sender {
    self.guanzhu.selected = !self.guanzhu.selected;
    self.guanzhu.yy_x += self.guanzhu.yy_width + YYSTopicCellMargin;
    if (self.guanzhu.selected) {
        [self.guanzhu setTitle:@"已关注" forState:UIControlStateSelected];
        [self.guanzhu setTitleColor:YYSOutStandingColor forState:UIControlStateSelected];
        [self.guanzhu setBackgroundImage:[UIImage imageNamed:@"tabbar_background"] forState:UIControlStateSelected];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.guanzhu.yy_x -= self.guanzhu.yy_width + YYSTopicCellMargin;
    }];
}
@end
