//
//  DBBook.h
//  DouBan
//
//  Created by 王蒙 on 15/9/5.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBBook : NSObject
/**中文名*/
@property (copy, nonatomic) NSString *title;
/**中文名*/
@property (copy, nonatomic) NSString *original_title;
/**书评*/
@property (copy, nonatomic) NSString *author_intro;
/**时间*/
@property (copy, nonatomic) NSString *pubdate;
/**价格*/
@property (copy, nonatomic) NSString *price;
/**本书的url*/
@property (copy, nonatomic) NSString *url;
/**图片的地址*/
@property (copy, nonatomic) NSString *image;
/**各种图*/
@property (copy, nonatomic) NSDictionary *images;
/**评分*/
@property (copy, nonatomic) NSDictionary *rating;
/**出版社*/
@property (copy, nonatomic) NSString *publisher;

@end
