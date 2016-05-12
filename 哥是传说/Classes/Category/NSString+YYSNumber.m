//
//  NSString+YYSNumber.m
//  哥是传说
//
//  Created by tarena on 16/4/1.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "NSString+YYSNumber.h"

@implementation NSString (YYSNumber)

+(instancetype)numberToString:(NSInteger)number
{
    NSString *str = [[NSString alloc] init];
    if (number == 0) {
        str = @"";
    } else if (number >= 10000) {
        str = [NSString stringWithFormat:@"%.1f万",number / 10000.0];
        
    } else {
        str = @(number).stringValue;
    }
    return str;
}

@end
