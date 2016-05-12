//
//  YYSDiscoverModel.h
//  哥是传说
//
//  Created by tarena on 16/4/7.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DiscoverData,God_Comment,Rotate_Banner,Banners,Banner_Url,Url_ListA,Categories,Category_List,My_Category_List,My_Top_Category_List;
@interface YYSDiscoverModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DiscoverData *data;

@end
@interface DiscoverData : NSObject

@property (nonatomic, strong) NSArray<My_Top_Category_List *> *my_top_category_list;

@property (nonatomic, strong) Rotate_Banner *rotate_banner;

@property (nonatomic, strong) Categories *categories;

@property (nonatomic, strong) God_Comment *god_comment;

@property (nonatomic, strong) NSArray<My_Category_List *> *my_category_list;

@end

@interface God_Comment : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *name;

@end

@interface Rotate_Banner : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<Banners *> *banners;

@end

@interface Banners : NSObject

@property (nonatomic, copy) NSString *schema_url;

@property (nonatomic, strong) Banner_Url *banner_url;

@end

@interface Banner_Url : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<Url_ListA *> *url_list;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger width;

@end

@interface Url_ListA : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface Categories : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger category_count;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, strong) NSArray<Category_List *> *category_list;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger priority;

@end

@interface Category_List : NSObject

@property (nonatomic, assign) BOOL is_recommend;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, copy) NSString *mix_weight;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) BOOL is_top;

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic, assign) NSInteger total_updates;

@property (nonatomic, copy) NSString *small_icon_url;

@property (nonatomic, assign) BOOL is_risk;

@property (nonatomic, assign) NSInteger big_category_id;

@property (nonatomic, copy) NSString *top_start_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *buttons;

@property (nonatomic, assign) NSInteger allow_text;

@property (nonatomic, copy) NSString *extra;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger post_rule_id;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, assign) NSInteger subscribe_count;

@property (nonatomic, assign) NSInteger allow_multi_image;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger today_updates;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *small_icon;

@property (nonatomic, copy) NSString *top_end_time;

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, strong) NSArray *material_bar;

@property (nonatomic, assign) NSInteger allow_gif;

@property (nonatomic, assign) NSInteger allow_text_and_pic;

@property (nonatomic, assign) NSInteger allow_video;

@property (nonatomic, copy) NSString *channels;

@property (nonatomic, assign) NSInteger dedup;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) BOOL has_timeliness;

@property (nonatomic, assign) BOOL isDingYue;

@end

@interface My_Category_List : NSObject

@property (nonatomic, assign) BOOL is_recommend;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, copy) NSString *mix_weight;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) BOOL is_top;

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic, assign) NSInteger total_updates;

@property (nonatomic, copy) NSString *small_icon_url;

@property (nonatomic, assign) BOOL is_risk;

@property (nonatomic, assign) NSInteger big_category_id;

@property (nonatomic, copy) NSString *top_start_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *buttons;

@property (nonatomic, assign) NSInteger allow_text;

@property (nonatomic, copy) NSString *extra;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger post_rule_id;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, assign) NSInteger subscribe_count;

@property (nonatomic, assign) NSInteger allow_multi_image;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger today_updates;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *small_icon;

@property (nonatomic, copy) NSString *top_end_time;

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, strong) NSArray *material_bar;

@property (nonatomic, assign) NSInteger allow_gif;

@property (nonatomic, assign) NSInteger allow_text_and_pic;

@property (nonatomic, assign) NSInteger allow_video;

@property (nonatomic, copy) NSString *channels;

@property (nonatomic, assign) NSInteger dedup;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) BOOL has_timeliness;

@end

@interface My_Top_Category_List : NSObject

@property (nonatomic, assign) BOOL is_recommend;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger share_type;

@property (nonatomic, copy) NSString *mix_weight;
//id - > ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) BOOL is_top;

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic, assign) NSInteger total_updates;

@property (nonatomic, copy) NSString *small_icon_url;

@property (nonatomic, assign) BOOL is_risk;

@property (nonatomic, assign) NSInteger big_category_id;

@property (nonatomic, copy) NSString *top_start_time;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *buttons;

@property (nonatomic, assign) NSInteger allow_text;

@property (nonatomic, copy) NSString *extra;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger post_rule_id;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, assign) NSInteger subscribe_count;

@property (nonatomic, assign) NSInteger allow_multi_image;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger today_updates;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *small_icon;

@property (nonatomic, copy) NSString *top_end_time;

@property (nonatomic, assign) BOOL visible;

@property (nonatomic, strong) NSArray *material_bar;

@property (nonatomic, assign) NSInteger allow_gif;

@property (nonatomic, assign) NSInteger allow_text_and_pic;

@property (nonatomic, assign) NSInteger allow_video;

@property (nonatomic, copy) NSString *channels;

@property (nonatomic, assign) NSInteger dedup;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, assign) BOOL has_timeliness;

@end

