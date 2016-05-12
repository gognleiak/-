//
//  YYSHomeViewController.m
//  哥是传说
//
//  Created by tarena on 16/3/31.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSHomeViewController.h"
#import "YYSFatherViewController.h"


@interface YYSHomeViewController () <UIScrollViewDelegate>
/** 选中的button */
@property (nonatomic,weak) UIButton *selectedBtn;

/**
 *  底部的指示器
 */
@property (nonatomic,weak) UIView *indicatorView;
/** 底部的所有内容 */
@property (nonatomic, weak) UIScrollView *contentView;
/** 顶部的所有标签 */
@property (nonatomic, weak) UIView *titlesView;
@end

@implementation YYSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化导航栏
    [self setNav];
    //添加标题栏
    [self setTitlesView];
    
    //添加子控制器
    [self addChildController];
    //添加内容view
    [self addContentView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

/**
 *  添加内容view
 */
-(void)addContentView
{
    UIScrollView *contentView = [[UIScrollView alloc] init];
    //    contentView.backgroundColor = [UIColor greenColor];
    //设置尺寸
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.showsHorizontalScrollIndicator = NO;
    contentView.showsVerticalScrollIndicator = NO;
    contentView.contentSize = CGSizeMake(self.view.yy_width * self.childViewControllers.count, 0);
    [self.view insertSubview:contentView atIndex:0];
    self.contentView = contentView;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self scrollViewDidEndScrollingAnimation:contentView];
}
/**
 *  添加子控制器
 */
-(void)addChildController
{
    YYSFatherViewController *recomand = [[YYSFatherViewController alloc] init];
    recomand.topicType = YYSTopicTypeREcommond;
    [self addChildViewController:recomand];

    
    YYSFatherViewController *video = [[YYSFatherViewController alloc] init];
    video.topicType = YYSTopicTypeVideo;
    [self addChildViewController:video];
    
    YYSFatherViewController *picture = [[YYSFatherViewController alloc] init];
    picture.topicType = YYSTopicTypePicture;
    [self addChildViewController:picture];
    
    YYSFatherViewController *word = [[YYSFatherViewController alloc] init];
    word.topicType = YYSTopicTypeWord;
    [self addChildViewController:word];
   
    
}

/**
 *  添加标题栏
 */
-(void)setTitlesView
{
    //添加标题栏
    UIView *Titlesview = [[UIView alloc] init];
    Titlesview.yy_width = self.view.yy_width;
    Titlesview.yy_y = 64;
    Titlesview.yy_height = 35;
    Titlesview.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    Titlesview.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    [self.view addSubview:Titlesview];
    
    //添加指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.yy_height = 2;
    indicatorView.yy_y = Titlesview.yy_height - indicatorView.yy_height;
    
    self.indicatorView = indicatorView;
    
    
    //添加标题栏里的button
    NSArray *titleArr = @[@"推荐",@"视频", @"图片", @"段子"];
    CGFloat y = 0;
    CGFloat width = self.view.yy_width / titleArr.count;
    CGFloat height = Titlesview.yy_height;
    for (int i = 0; i < titleArr.count; ++i) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        CGFloat x = i * width;
        btn.frame = CGRectMake(x, y, width, height);
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [Titlesview addSubview:btn];
        
        //默认选中第一个
        if (i == 0) {
            btn.enabled = NO;
            self.selectedBtn = btn;
            [Titlesview layoutIfNeeded];
            //计算label尺寸
            [btn.titleLabel sizeToFit];
            self.indicatorView.yy_x = btn.titleLabel.yy_x;
            
            self.indicatorView.yy_width = btn.titleLabel.yy_width + 2;
        }
    }
    
    //最后添加指示器
    [Titlesview addSubview:indicatorView];
    self.titlesView = Titlesview;
}
-(void)viewWillAppear:(BOOL)animated{
    
}
/**
 *  button的点击事件
 *
 *  @param btn
 */
-(void)clickBtn:(UIButton *)btn
{
    
    //控制选中btn的文字颜色
    self.selectedBtn.enabled = YES;
    btn.enabled = NO;
    self.selectedBtn = btn;
    
    
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.yy_centerX = btn.yy_centerX;
        self.indicatorView.yy_width = btn.titleLabel.yy_width + 2;
    }];
    
    //滚动UIScroll
    CGPoint offset = self.contentView.contentOffset;
    offset.x = btn.tag * self.view.yy_width;
    [self.contentView setContentOffset:offset animated:YES];
}

/**
 *  初始化导航栏
 */
-(void)setNav
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = YYSGlobalColor;
    self.navigationItem.title = @"主页";
    
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
}


#pragma mark- <UIScrollViewDelegate>

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //拿出当前的索引
    NSInteger index = scrollView.contentOffset.x / self.view.yy_width;
    
    //取出对应的控制器
    UITableViewController *vc = self.childViewControllers[index];
    
    vc.view.yy_x = scrollView.contentOffset.x;
    vc.view.yy_y = 0;
    vc.view.yy_height = scrollView.yy_height;
    //    vc.view.yy_width = scrollView.yy_width;
    
    
    [scrollView addSubview:vc.view];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    //主动点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.yy_width;
    [self clickBtn:self.titlesView.subviews[index]];
}

@end
