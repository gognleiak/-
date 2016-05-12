//
//  YYSAllDataModel.m
//  哥是传说
//
//  Created by tarena on 16/4/1.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import "YYSAllDataModel.h"

@implementation YYSAllDataModel

@end



@implementation Data1
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data": [Data2 class]};
}
@end


@implementation Data2

-(CGFloat)cellHeight
{
    if (!_cellHeight) {
        
        _cellHeight = YYSTopicCellTextMaxY + YYSTopicCellMargin;
        CGSize maxSize = CGSizeMake(YYSScreenW -  2 * YYSTopicCellMargin, CGFLOAT_MAX);
        
        CGFloat labelH = [self.group.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{                                                                    NSFontAttributeName : [UIFont systemFontOfSize:21]                                                                           } context:nil].size.height;
        _cellHeight += labelH + YYSTopicCellMargin;
        
        if ((self.group.large_image != nil || self.group.large_image_list.count != 0) && self.group.origin_video == nil) {
            CGFloat pictureX = YYSTopicCellMargin;
            CGFloat pictureY = YYSTopicCellTextMaxY + YYSTopicCellMargin +labelH + YYSTopicCellMargin;
            CGFloat pictureW = maxSize.width;
            CGFloat pictureH = 0;
            if (self.group.large_image_list.count == 0) {
                pictureH = self.group.large_image.height * pictureW / self.group.large_image.width;
            } else {
                pictureH = 1000;
                
            }
            if (pictureH >= 800) {
                pictureH = 300;
                self.bigPicture = YES;
            }
            _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            _cellHeight += pictureH + YYSTopicCellMargin;
        } else if (self.group.origin_video != nil) {
            CGFloat videoX = YYSTopicCellMargin;
            CGFloat videoY = YYSTopicCellTextMaxY + YYSTopicCellMargin +labelH + YYSTopicCellMargin;
            CGFloat videoW = YYSScreenW - 2 * YYSTopicCellMargin;
            CGFloat videoH = self.group.origin_video.height * videoW/ self.group.origin_video.width;
            _videoF = CGRectMake(videoX, videoY, videoW, videoH);
            _cellHeight += videoH + YYSTopicCellMargin;
        }
        _cellHeight += YYSTopicCellBottomBarH + 2 * YYSTopicCellMargin;
    }
    return _cellHeight;
}
@end


@implementation Group
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"dislike_reason": [Dislike_Reason class],@"large_image_list": [Large_Image class]};
}


+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation Large_Cover
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_List class]};
}
@end


@implementation Url_List

@end


@implementation P_Video480
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_List class]};
}
@end





@implementation Origin_Video
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_List class]};
}
@end





@implementation Neihan_Hot_Link

@end


@implementation Activity

@end


@implementation P_Video720
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_List class]};
}
@end





@implementation P_Video360
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_List class]};
}
@end





@implementation Medium_Cover
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_List class]};
}
@end





@implementation User

@end


@implementation Dislike_Reason
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end

@implementation Large_Image

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"url_list": [Url_List class]};
}

@end

