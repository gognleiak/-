//
//  YYSDiscoverViewModel.m
//  哥是传说
//
//  Created by tarena on 16/4/7.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSDiscoverViewModel.h"

@implementation YYSDiscoverViewModel
-(NSInteger)rowNumber
{
    return self.datas.count;
}
-(Category_List *)dataForIndex:(NSInteger)index
{
    return self.datas[index];
}
-(NSMutableArray<Category_List *> *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

@end
