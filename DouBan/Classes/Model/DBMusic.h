//
//  DBMusic.h
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBMusic : NSObject
/**中文名*/
@property (copy, nonatomic) NSString *title;
/**书评*/
@property (copy, nonatomic) NSString *alt_title;
/**演唱*/
@property (copy, nonatomic) NSString *author;
/**介绍*/
@property (copy, nonatomic) NSString *summary;
@property (copy, nonatomic) NSString *image;
/**评分*/
@property (copy, nonatomic) NSDictionary *rating;

@end
