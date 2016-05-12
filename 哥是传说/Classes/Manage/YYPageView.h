//
//  YYPageView.h
//  分页接口
//
//  Created by tarena on 16/2/18.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYPageView : UIView
/** 图片名数据 */
@property(nonatomic,strong)NSMutableArray *imageNames;
/** 其他点颜色 */
@property(nonatomic,strong)UIColor *otherColor;

/** 当前点颜色 */
@property(nonatomic,strong)UIColor *currentColor;

+(instancetype)pageView;
@end
