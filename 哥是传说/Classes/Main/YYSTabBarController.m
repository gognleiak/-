//
//  YYSTabBarController.m
//  哥是传说
//
//  Created by tarena on 16/3/31.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSTabBarController.h"
#import "YYSNavigationController.h"
#import "YYSDiscoverViewController.h"
#import "YYSHomeViewController.h"
#import "YYSMineViewController.h"
#import "YYSCheckController.h"

@implementation YYSTabBarController

+(void)initialize
{
    //利用富文本属性设置文字颜色
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *Attributes = [NSMutableDictionary dictionary];
    Attributes[NSForegroundColorAttributeName] = [UIColor purpleColor];
    [item setTitleTextAttributes:Attributes forState:UIControlStateNormal];
    //设置tabBar的背景图片
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];

}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //1设置子控制器
    [self setUpChildController];
}

-(void)setUpChildController
{
    YYSHomeViewController *home = [[YYSHomeViewController  alloc] init];
    [self setChild:home image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"主页"];
    
    YYSDiscoverViewController *discover = [[YYSDiscoverViewController  alloc] init];
    [self setChild:discover image:@"tabbar_discover" selectedImage:@"tabbar_discover_highlighted" title:@"发现"];
    
    
    YYSMineViewController *mine = [[YYSMineViewController  alloc] init];
    [self setChild:mine image:@"tabbar_profile" selectedImage:@"tabbar_profile_highlighted" title:@"我的"];
    
    YYSCheckController *check = [[YYSCheckController  alloc] init];
    [self setChild:check image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_highlighted" title:@"审核"];
}
/**
 *  添加子控制器
 *
 *  @param vc            字控制器类型
 *  @param image         TabBarItem的image
 *  @param selectedImage TabBarItem选中的image
 *  @param title         TabBarItem的标题
 */
-(void)setChild:(UIViewController *)vc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
//    vc.view.backgroundColor = [UIColor orangeColor];
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.tabBarItem.title = title;
    [self addChildViewController:[[YYSNavigationController alloc] initWithRootViewController:vc]];
}
@end
