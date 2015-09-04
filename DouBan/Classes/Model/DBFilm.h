//
//  DBFilm.h
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBFilm : NSObject
/**中文名*/
@property (copy, nonatomic) NSString *title;
/**中文名*/
@property (copy, nonatomic) NSString *original_title;
/**又名*/
@property (copy, nonatomic) NSArray *aka;
/**条目页URL*/
@property (copy, nonatomic) NSString *alt;
/**再看人数*/
@property (copy, nonatomic) NSString *do_count;
/**看过人数*/
@property (copy, nonatomic) NSString *collect_count;
/**条目分类*/
@property (copy, nonatomic) NSString *subtype;
/**电影海报图*/
@property (copy, nonatomic) NSDictionary *images;
/**评分*/
@property (copy, nonatomic) NSDictionary *rating;
/**移动版条目页*/
@property (copy, nonatomic) NSString *mobile_url;
/**评分人数*/
@property (copy, nonatomic) NSString *ratings_count;
/**想看人数*/
@property (copy, nonatomic) NSString *wish_count;
/**导演*/
@property (copy, nonatomic) NSArray *directors;
/**主演*/
@property (copy, nonatomic) NSArray *casts;
/**时间*/
@property (copy, nonatomic) NSString *year;
/**简介*/
@property (copy, nonatomic) NSString *summary;

@property (copy, nonatomic)NSArray *popular_reviews;


@end
