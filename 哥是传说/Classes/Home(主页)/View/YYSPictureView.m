//
//  YYSPictureView.m
//  哥是传说
//
//  Created by tarena on 16/4/1.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSPictureView.h"
#import "YYSAllDataModel.h"
#import "YYShowPictureViewController.h"
#import "YYSProgressView.h"
@interface YYSPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;
@property (weak, nonatomic) IBOutlet UIButton *seeBigPictureButton;

@property (weak, nonatomic) IBOutlet YYSProgressView *progressView;
@end

@implementation YYSPictureView

-(void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
 
//    self.translatesAutoresizingMaskIntoConstraints = YES;
    self.pictureImage.userInteractionEnabled = YES;
    [self.pictureImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture:)]];

}

-(void)setData:(Data2 *)data
{
    _data = data;
    [self.progressView setProgress:self.data.pictureProgress animated:YES];
    if (data.group.large_image_list.count == 0) {
        [self.pictureImage sd_setImageWithURL:[NSURL URLWithString:data.group.large_image.url_list.firstObject.url] placeholderImage:[UIImage imageNamed:@"placehold"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            self.progressView.hidden = NO;
            data.pictureProgress = 1.0 * receivedSize / expectedSize;
            [self.progressView setProgress:data.pictureProgress animated:YES];
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            self.progressView.hidden = YES;
            if (data.group.large_image.height >= 800) {
                //开启图形上下文
                UIGraphicsBeginImageContextWithOptions(data.pictureF.size, YES, 0.0);
                
                // 将下载完的image对象绘制到图形上下文
                CGFloat width = data.pictureF.size.width;
                CGFloat height = width * image.size.height / image.size.width;
                [image drawInRect:CGRectMake(0, 0, width, height)];
                
                // 获得图片
                self.pictureImage.image = UIGraphicsGetImageFromCurrentImageContext();
                // 结束图形上下文
                UIGraphicsEndImageContext();
            }
        }];
        
        self.seeBigPictureButton.hidden = !data.isBigPicture;
        self.pictureImage.contentMode = UIViewContentModeScaleToFill;
    } else {
        self.seeBigPictureButton.hidden = NO;
        [self.pictureImage sd_setImageWithURL:[NSURL URLWithString:data.group.large_image_list.firstObject.url_list.firstObject.url] placeholderImage:[UIImage imageNamed:@"placehold"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            self.progressView.hidden = NO;
            data.pictureProgress = 1.0 * receivedSize / expectedSize;
            [self.progressView setProgress:data.pictureProgress animated:YES];
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            self.progressView.hidden = YES;

            //开启图形上下文
            UIGraphicsBeginImageContextWithOptions(data.pictureF.size, YES, 0.0);
            
            // 将下载完的image对象绘制到图形上下文
            CGFloat width = data.pictureF.size.width;
            CGFloat height = width * image.size.height / image.size.width;
            [image drawInRect:CGRectMake(0, 0, width, height)];
            
            // 获得图片
            self.pictureImage.image = UIGraphicsGetImageFromCurrentImageContext();
            // 结束图形上下文
            UIGraphicsEndImageContext();
        }];
        
        self.pictureImage.contentMode = UIViewContentModeScaleAspectFill;
    }
//    NSLog(@"%@",data.group.large_image.url_list.firstObject.url);

}

+(instancetype)pictureView
{
    return [[NSBundle mainBundle] loadNibNamed:@"YYSPictureView" owner:nil options:nil].firstObject;
}

- (IBAction)showPicture:(id)sender {
    if (self.data.pictureProgress == 1 || self.data.pictureProgress == 0) {
        
        YYShowPictureViewController *spvc = [[YYShowPictureViewController alloc] init];
        spvc.data = self.data;
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:spvc animated:YES completion:^{
            
        }];
    }
}

@end
