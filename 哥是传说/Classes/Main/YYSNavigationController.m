//
//  YYSNavigationController.m
//  哥是传说
//
//  Created by tarena on 16/3/31.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSNavigationController.h"

@implementation YYSNavigationController

+(void)initialize
{
    UINavigationBar *naBar = [UINavigationBar appearance];
    [naBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    naBar.tintColor = YYSGlobalColor;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = YYSGlobalColor;
    [naBar setTitleTextAttributes:dict];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
}
@end
