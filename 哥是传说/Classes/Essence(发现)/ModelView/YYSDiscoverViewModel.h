//
//  YYSDiscoverViewModel.h
//  哥是传说
//
//  Created by tarena on 16/4/7.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYSDiscoverModel.h"
@interface YYSDiscoverViewModel : NSObject
/** 根据UI定义属性和方法 */
@property (nonatomic) NSInteger rowNumber;
- (Category_List *)dataForIndex:(NSInteger)index;



/** 根据Model定义属性和方法 */
@property (nonatomic, strong) NSMutableArray<Category_List *> *datas;
@end
