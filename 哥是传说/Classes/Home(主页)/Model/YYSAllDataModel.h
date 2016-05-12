//
//  YYSAllDataModel.h
//  哥是传说
//
//  Created by tarena on 16/4/1.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data1,Data2,Group,Large_Cover,Url_List,P_Video480,Url_List,Origin_Video,Url_List,Neihan_Hot_Link,Activity,P_Video720,Url_List,P_Video360,Url_List,Medium_Cover,Url_List,User,Dislike_Reason,Large_Image;
@interface YYSAllDataModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) Data1 *data;

@end
@interface Data1 : NSObject

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, assign) NSInteger min_time;

@property (nonatomic, strong) NSArray<Data2 *> *data;

@property (nonatomic, assign) CGFloat max_time;

@property (nonatomic, copy) NSString *tip;

@end

@interface Data2 : NSObject

@property (nonatomic, strong) Group *group;

@property (nonatomic, assign) NSInteger online_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSArray *comments;

@property (nonatomic, assign) NSInteger display_time;

//辅助属性
@property(nonatomic,assign)CGFloat cellHeight;
//类型帖子
@property(nonatomic,assign) YYSTopicType topicType;
//PictureF
@property(nonatomic,assign)CGRect pictureF;
//VideoF
@property(nonatomic,assign)CGRect videoF;

/** 图片的下载进度 */
@property (nonatomic, assign) CGFloat pictureProgress;
/** 是否是大图*/
@property (nonatomic, assign,getter = isBigPicture) BOOL bigPicture;
/** 是否被点赞*/
@property(nonatomic,assign)BOOL isDing;
/** 是否被点踩*/
@property(nonatomic,assign)BOOL isCai;
@end

@interface Group : NSObject

@property (nonatomic, assign) NSInteger user_favorite;

@property (nonatomic, strong) User *user;

@property (nonatomic, copy) NSString *publish_time;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) long long ID;

@property (nonatomic, strong) Origin_Video *origin_video;

@property (nonatomic, assign) NSInteger play_count;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, assign) BOOL category_visible;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *flash_url;

@property (nonatomic, strong) Neihan_Hot_Link *neihan_hot_link;

@property (nonatomic, assign) NSInteger user_repin;

@property (nonatomic, copy) NSString *cover_image_uri;

@property (nonatomic, copy) NSString *status_desc;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<Dislike_Reason *> *dislike_reason;

@property (nonatomic, assign) NSInteger repin_count;

@property (nonatomic, copy) NSString *cover_image_url;

@property (nonatomic, assign) NSInteger digg_count;

@property (nonatomic, assign) NSInteger share_count;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger video_width;

@property (nonatomic, copy) NSString *neihan_hot_start_time;

@property (nonatomic, assign) NSInteger is_video;

@property (nonatomic, assign) NSInteger has_hot_comments;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger go_detail_count;

@property (nonatomic, assign) NSInteger favorite_count;

@property (nonatomic, strong) Large_Cover *large_cover;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger online_time;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, assign) NSInteger category_type;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, assign) BOOL is_anonymous;

@property (nonatomic, assign) BOOL quick_comment;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, assign) NSInteger media_type;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, strong) Medium_Cover *medium_cover;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, strong) P_Video480 *p_video480;

@property (nonatomic, assign) NSInteger video_height;

@property (nonatomic, assign) NSInteger is_public_url;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *neihan_hot_end_time;

@property (nonatomic, assign) NSInteger is_can_share;

@property (nonatomic, assign) BOOL is_neihan_hot;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger has_comments;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, strong) P_Video360 *p_video360;

@property (nonatomic, strong) P_Video720 *p_video720;

@property (nonatomic, copy) NSString *m3u8_url;

@property (nonatomic, assign) NSInteger label;

@property (nonatomic, copy) NSString *id_str;

@property (nonatomic, strong) Activity *activity;

@property (nonatomic, assign) BOOL allow_dislike;

@property (nonatomic, strong) Large_Image *large_image;


@property (nonatomic, strong) NSArray<Large_Image *> *large_image_list;



@end

@interface Large_Cover : NSObject

@property (nonatomic, strong) NSArray<Url_List *> *url_list;

@property (nonatomic, copy) NSString *uri;

@end

@interface Large_Image : NSObject

@property (nonatomic, strong) NSArray<Url_List *> *url_list;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@end

@interface Url_List : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface P_Video480 : NSObject

@property (nonatomic, strong) NSArray<Url_List *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end



@interface Origin_Video : NSObject

@property (nonatomic, strong) NSArray<Url_List *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end



@interface Neihan_Hot_Link : NSObject

@end

@interface Activity : NSObject

@end

@interface P_Video720 : NSObject

@property (nonatomic, strong) NSArray<Url_List *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end



@interface P_Video360 : NSObject

@property (nonatomic, strong) NSArray<Url_List *> *url_list;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@end



@interface Medium_Cover : NSObject

@property (nonatomic, strong) NSArray<Url_List *> *url_list;

@property (nonatomic, copy) NSString *uri;

@end



@interface User : NSObject

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, assign) NSInteger ugc_count;

@property (nonatomic, assign) BOOL is_following;

@property (nonatomic, assign) NSInteger followers;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) NSInteger followings;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *avatar_url;

@end

@interface Dislike_Reason : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@end

