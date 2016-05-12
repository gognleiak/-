//
//  YYSAllDataViewModel.h
//  哥是传说
//
//  Created by tarena on 16/4/6.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYSAllDataModel.h"

@interface YYSAllDataViewModel : NSObject
/** 根据UI定义属性和方法 */
@property (nonatomic) NSInteger rowNumber;
- (Data2 *)dataForIndex:(NSInteger)index;

/** 根据Model定义属性和方法 */
@property (nonatomic, strong) NSMutableArray<Data2 *> *datas;
@end
