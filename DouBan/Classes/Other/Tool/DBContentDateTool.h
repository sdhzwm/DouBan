//
//  DBContentDateTool.h
//  DouBan
//
//  Created by 王蒙 on 15/9/5.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class DBFilm;
@interface DBContentDateTool : NSObject
/**根据搜索的类型和内容来返回数组*/
+(void)initDBFilmNetworkWithSearchType:(NSString *)searchType
                            searchName:(NSString *)searchName
                            complete:(void (^)(NSArray *arry))complete;

@end
