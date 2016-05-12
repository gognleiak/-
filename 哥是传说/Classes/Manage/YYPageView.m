//
//  YYPageView.m
//  分页接口
//
//  Created by tarena on 16/2/18.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYPageView.h"

@interface YYPageView () <UIScrollViewDelegate>
/** 分页控件 */
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/** 滚动控件 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end


@implementation YYPageView
#pragma mark -类工厂方法
+(instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

#pragma mark -重写set方法
-(void)setImageNames:(NSMutableArray *)imageNames
{
    _imageNames = imageNames;
    
    for (int i = 0; i < imageNames.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = self.scrollView.frame;
        [imageView sd_setImageWithURL:imageNames[i]];
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = imageNames.count;
    
    
    
}
-(void)setOtherColor:(UIColor *)otherColor
{
    _otherColor = otherColor;
    self.pageControl.pageIndicatorTintColor = self.otherColor;
}
-(void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    self.pageControl.currentPageIndicatorTintColor = self.currentColor;
}
#pragma mark -监听滚动事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5);
    
}

#pragma mark -重写layout方法
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    
    //设置pageControlor
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    CGFloat pageX = scrollW - pageW;
    CGFloat pageY = scrollH - pageH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    
    //设置滚动内容大小
    self.scrollView.contentSize = CGSizeMake(scrollW * _imageNames.count, 0);
    
    // 设置所有imageView的frame
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
    }
    
    
}

@end
