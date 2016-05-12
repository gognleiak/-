//
//  YYShowPictureViewController.m
//  百思不得姐
//
//  Created by tarena on 16/3/19.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYShowPictureViewController.h"
#import "YYSAllDataModel.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import "YYSProgressView.h"
#import "YYSAllDataModel.h"
#import "UMSocial.h"

@interface YYShowPictureViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet YYSProgressView *progress;

@end

@implementation YYShowPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setPicture];
    
}

-(UIImageView *)pictureView
{
    if (_pictureView == nil) {
         UIImageView *imageV= [[UIImageView alloc] init];
        _pictureView = imageV;
    }
    return _pictureView;
}

-(void)viewDidAppear:(BOOL)animated
{
    
}
/**
 *  添加图图片
 */
-(void)setPicture
{
    //获取图片
    UIImageView *imageView = [[UIImageView alloc] init];
    //进来就刷新一下进度
    [self.progress setProgress:self.data.pictureProgress animated:YES];
    CGFloat imageW = YYSScreenW;
    static CGFloat imageH = 0;
    __block CGFloat scrollH = 0;
    //加载图片
    if (self.data.group.large_image_list.count == 0) {
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.data.group.large_image.url_list.firstObject.url] placeholderImage:[UIImage imageNamed:@"placehold"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            self.progress.hidden = NO;
            self.data.pictureProgress = 1.0 * receivedSize / expectedSize;
            [self.progress setProgress:self.data.pictureProgress animated:YES];
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            self.progress.hidden = YES;
            self.view.backgroundColor = [UIColor grayColor];

        }];
        imageH = self.data.group.large_image.height * imageW / self.data.group.large_image.width;
        if (imageH > YYSScreenH) {
            imageView.frame = CGRectMake(0, 0, imageW, imageH);
            self.scrollView.contentSize = CGSizeMake(imageW, imageH);
            
        } else {
            //设置尺寸
            imageView.yy_width = imageW;
            imageView.yy_height = imageH;
            imageView.yy_centerY = YYSScreenH * 0.5;
        }
        
        
        
        self.pictureView = imageView;
        
        //添加到scrollView上
        [self.scrollView addSubview:imageView];
    } else {
//        NSMutableArray *imageArr = [NSMutableArray array];
        
        
        for (int i = 0; i < self.data.group.large_image_list.count; ++i) {
            UIImageView *bigImageView = [[UIImageView alloc] init];
            
            [bigImageView sd_setImageWithURL:[NSURL URLWithString:self.data.group.large_image_list[i].url_list.firstObject.url] placeholderImage:[UIImage imageNamed:@"placehold"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                self.progress.hidden = i != 0;
                self.data.pictureProgress = 1.0 * receivedSize / expectedSize;
                [self.progress setProgress:self.data.pictureProgress animated:YES];
                
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                NSLog(@"%@",image);
                imageH = self.data.group.large_image_list[i].height * imageW / self.data.group.large_image_list[i].width;
                self.progress.hidden = YES;
       
                //设置尺寸
                bigImageView.frame = CGRectMake(0, scrollH, imageW, imageH);
//                self.scrollView.contentSize = CGSizeMake(imageW, imageH);
                scrollH += self.data.group.large_image_list[i].height * imageW / self.data.group.large_image_list[i].width;
                self.view.backgroundColor = [UIColor grayColor];
                //添加到scrollView上
                [self.scrollView addSubview:bigImageView];
                
                self.scrollView.contentSize = CGSizeMake(imageW, scrollH);
                
                //开启图形上下文
//                UIGraphicsBeginImageContextWithOptions(self.scrollView.contentSize, NO, 0);
//                CGContextRef ctx = UIGraphicsGetCurrentContext();
//                [bigImageView.layer r];
//                UIImage *imageSave = UIGraphicsGetImageFromCurrentImageContext();
//                UIGraphicsEndImageContext();
//                self.pictureView.image = imageSave;
                
                
            }];
        }
    };
}


/**
 *  换回
 *
 *  @param sender
 */
- (IBAction)back:(id)sender {

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
/**
 *  保存
 *
 *  @param sender
 */
- (IBAction)save:(id)sender {
    UIImageWriteToSavedPhotosAlbum(self.pictureView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        NSString *str = image ? @"该图片不能保存" : @"保存失败";
        [SVProgressHUD showErrorWithStatus:str];

    } else {
        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}
- (IBAction)share:(UIButton *)sender {
    UIImage *image = self.pictureView.image;
    NSString *shareText = self.data.group.text;
    NSString *url = self.data.group.share_url;
    NSString *title = self.data.group.status_desc;
    [UMSocialSnsService presentSnsIconSheetView:self
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
@end
