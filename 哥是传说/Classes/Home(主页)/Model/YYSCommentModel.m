//
//  YYSCommentModel.m
//  哥是传说
//
//  Created by tarena on 16/4/8.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSCommentModel.h"

@implementation YYSCommentModel

@end
@implementation CommentData
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"top_comments": [Top_Comments class],@"recent_comments": [Recent_Comments class]};
}
@end


@implementation Top_Comments
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"descriptionStr": @"description"};
}
@end


@implementation Recent_Comments
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"descriptionStr": @"description"};
}
@end


