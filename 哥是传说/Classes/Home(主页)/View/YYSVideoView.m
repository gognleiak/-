
//
//  YYSVideoView.m
//  哥是传说
//
//  Created by tarena on 16/4/3.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSVideoView.h"
#import "YYSAllDataModel.h"
#import "YYSProgressView.h"
@interface YYSVideoView ()

@property (weak, nonatomic) IBOutlet UIButton *playBtn;


/** 初始化图片*/
@property (weak, nonatomic) IBOutlet UIImageView *imageViewA;
/** 播放次数 */
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
/** 播放时长 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicateView;
@property (weak, nonatomic) IBOutlet YYSProgressView *progressView;
//@property (weak, nonatomic) IBOutlet UIButton *fullScreenBtn;
@property(nonatomic,strong)NSString *url;

@end

@implementation YYSVideoView
#pragma mark - 懒加载progressView
-(YYSProgressView *)progressView
{
    if (_progressView == nil) {
        YYSProgressView *view = [[YYSProgressView alloc] init];
        _progressView = view;
    }
    return _progressView;
}
#pragma mark - 懒加载playerController

-(MPMoviePlayerController *)playerController
{
    if (_playerController == nil) {
        _playerController = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:self.data.group.origin_video.url_list.firstObject.url]];
        
        _playerController.view.frame = self.bounds;
        [self insertSubview:_playerController.view atIndex:1];
        // 5.设置属性
//        _playerController.controlStyle = MPMovieControlStyleNone;
//        _playerController.controlStyle = MPMovieControlStyleNone;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pareplay) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        
    }
    return _playerController;
}

-(void)pareplay
{
//    NSLog(@"playOrPause");
    self.indicateView.hidden = YES;
}
#pragma mark - 类方法

+(instancetype)videoView
{
    YYSVideoView *view = [[NSBundle mainBundle] loadNibNamed:@"YYSVideoView" owner:nil options:nil].firstObject;
    return view;
}

#pragma mark - 重写setter方法

-(void)setData:(Data2 *)data
{
    _data = data;
    
    
    [self.imageViewA sd_setImageWithURL:[NSURL URLWithString:self.data.group.large_cover.url_list.firstObject.url] placeholderImage:[UIImage imageNamed:@"placehold"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden = NO;
        self.playBtn.hidden = YES;
//        self.imageViewA.hidden = NO;
        data.pictureProgress = 1.0 * receivedSize / expectedSize;
        [self.progressView setProgress:data.pictureProgress animated:YES];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        

        if (![self.url isEqualToString:data.group.origin_video.url_list.firstObject.url]) {
            self.playBtn.hidden = NO;
//            self.imageViewA.hidden = YES;
        }
        self.progressView.hidden = YES;
    }];
    self.countLabel.text = [NSString numberToString:data.group.go_detail_count];
    NSInteger minute = data.group.duration / 60;
    NSInteger second = (NSInteger)data.group.duration % 60;
    self.timeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
    if (![self.url isEqualToString:data.group.origin_video.url_list.firstObject.url]) {
        [self.playerController.view removeFromSuperview];
        self.playerController = nil;
        self.playBtn.hidden = NO;
        self.bottomView.hidden = NO;
        self.indicateView.hidden = YES;
    }

}

#pragma mark - 点击了play
- (IBAction)play:(id)sender {
    [self.playerController.view removeFromSuperview];
    self.playerController = nil;
    self.playBtn.hidden = YES;
    self.bottomView.hidden = YES;
    self.indicateView.hidden = NO;
//    self.imageViewA.hidden = YES;
    [self.playerController play];
    self.url = self.data.group.origin_video.url_list.firstObject.url;
}

-(void)dealloc
{
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
