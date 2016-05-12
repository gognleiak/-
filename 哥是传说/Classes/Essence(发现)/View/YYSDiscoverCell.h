//
//  YYSDiscoverCell.h
//  哥是传说
//
//  Created by tarena on 16/4/7.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Category_List;
@interface YYSDiscoverCell : UITableViewCell
/**
 *  模型
 */
@property (nonatomic,strong) Category_List *CategoryModel;
//类方法
+(instancetype)discoverCell;

@end
