//
//  YYSConst.h
//  哥是传说
//
//  Created by tarena on 16/3/31.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    YYSTopicTypeREcommond = -101,//推荐
    YYSTopicTypeVideo = -104,//视频
    YYSTopicTypePicture = -103,//图片
    YYSTopicTypeWord = -102//段子
}YYSTopicType;


/** 精华-顶部标题的高度 */
UIKIT_EXTERN CGFloat const YYSTitlesViewH;

/** 精华-顶部标题的Y */
UIKIT_EXTERN CGFloat const YYSTitlesViewY;

/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const YYSTopicCellMargin;

/** 精华-cellText-最大Y值 */
UIKIT_EXTERN CGFloat const YYSTopicCellTextMaxY;


/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const YYSTopicCellBottomBarH;

