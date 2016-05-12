//
//  NSDate+YYAExtension.m
//  百思不得姐
//
//  Created by tarena on 16/3/18.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "NSDate+YYAExtension.h"

@implementation NSDate (YYAExtension)

-(NSDateComponents *)deltaFrom:(NSDate *)from
{
    //取出日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    //比较时间
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth |
                            NSCalendarUnitDay | NSCalendarUnitHour |
                           NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:from toDate:self options:0];
}

-(BOOL)isThisYear
{
    //取出日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}

-(BOOL)isYesterday
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

-(BOOL)isToday
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *nowTime = [fmt stringFromDate:[NSDate date]];
    NSString *selfTime = [fmt stringFromDate:self];
    
    return [nowTime isEqualToString:selfTime];
    
}
+(NSString *)timeSpToString:(NSInteger)timeSp
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *confromTimesp = [self dateWithTimeIntervalSince1970:timeSp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

@end
