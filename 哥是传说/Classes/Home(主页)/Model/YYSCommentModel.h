//
//  YYSCommentModel.h
//  哥是传说
//
//  Created by tarena on 16/4/8.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CommentData,Top_Comments,Recent_Comments;
@interface YYSCommentModel : NSObject

@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, strong) CommentData *data;

@property (nonatomic, assign) BOOL new_comment;

@property (nonatomic, assign) NSInteger total_number;

@end
@interface CommentData : NSObject

@property (nonatomic, strong) NSArray<Top_Comments *> *top_comments;

@property (nonatomic, strong) NSArray<Recent_Comments *> *recent_comments;

@end

@interface Top_Comments : NSObject
//description -> descriptionStr
@property (nonatomic, copy) NSString *descriptionStr;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, assign) long long id;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, copy) NSString *user_profile_url;

@property (nonatomic, copy) NSString *user_profile_image_url;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, copy) NSString *platform_id;

@property (nonatomic, assign) NSInteger is_digg;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger digg_count;

@end

@interface Recent_Comments : NSObject
//description -> descriptionStr
@property (nonatomic, copy) NSString *descriptionStr;

@property (nonatomic, assign) NSInteger user_digg;

@property (nonatomic, assign) long long id;

@property (nonatomic, assign) NSInteger bury_count;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) long long user_id;

@property (nonatomic, assign) NSInteger user_bury;

@property (nonatomic, copy) NSString *user_profile_url;

@property (nonatomic, copy) NSString *user_profile_image_url;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, assign) BOOL user_verified;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) long long group_id;

@property (nonatomic, copy) NSString *platform_id;

@property (nonatomic, assign) NSInteger is_digg;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger digg_count;

@end

