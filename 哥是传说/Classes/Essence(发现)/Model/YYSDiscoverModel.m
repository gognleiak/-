//
//  YYSDiscoverModel.m
//  哥是传说
//
//  Created by tarena on 16/4/7.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSDiscoverModel.h"

@implementation YYSDiscoverModel

@end
@implementation DiscoverData
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"my_top_category_list": [My_Top_Category_List class],@"my_category_list": [My_Category_List class]};
}



@end


@implementation God_Comment

@end


@implementation Rotate_Banner
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"banners": [Banners class]};
}
@end


@implementation Banners

@end


@implementation Banner_Url
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_ListA class]};
}
@end





@implementation Categories
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"category_list": [Category_List class]};
}
@end


@implementation Category_List
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation My_Category_List
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation My_Top_Category_List
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}

@end
@implementation Url_ListA



@end




