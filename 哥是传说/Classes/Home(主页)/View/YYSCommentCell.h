//
//  YYSCommentCell.h
//  哥是传说
//
//  Created by tarena on 16/4/8.
//  Copyright © 2016年 tarana. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Recent_Comments,Top_Comments;

@interface YYSCommentCell : UITableViewCell

+(instancetype)commentCell;
@property(nonatomic,strong)Top_Comments *topComment;
@property(nonatomic,strong)Recent_Comments *recentComment;
@end
