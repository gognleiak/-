//
//  YYSAllDataViewModel.m
//  哥是传说
//
//  Created by tarena on 16/4/6.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSAllDataViewModel.h"

@implementation YYSAllDataViewModel

-(NSInteger)rowNumber
{
    return self.datas.count;
}
-(Data2 *)dataForIndex:(NSInteger)index
{
    return self.datas[index];
}
-(NSMutableArray<Data2 *> *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

@end
