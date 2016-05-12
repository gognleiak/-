//
//  YYSVideoView.h
//  哥是传说
//
//  Created by tarena on 16/4/3.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@class Data2;
@interface YYSVideoView : UIView

+(instancetype)videoView;

@property(nonatomic,strong)Data2 *data;
/** 播放器 */
@property (nonatomic, strong) MPMoviePlayerController *playerController;

@end
