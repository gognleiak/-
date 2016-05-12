//
//  NSDate+YYAExtension.h
//  百思不得姐
//
//  Created by tarena on 16/3/18.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YYAExtension)
/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;
//时间戳转标准时间并转为字符串的方法
+ (NSString *)timeSpToString:(NSInteger )timeSp;

@end
