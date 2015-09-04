//
//  DBContentDateTool.m
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//用来返回数据
#import "DBContentDateTool.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <SVProgressHUD.h>
#import "DBFilm.h"
#import "DBBook.h"
#import "DBMusic.h"
#import "DBConst.h"
//根据传来的参数来确定需要返回的什么样的数据
#define DBSearchURLString(searchType,searchName) [[NSString stringWithFormat:@"http://api.douban.com/v2/%@/search?%@",searchType,searchName]stringByAddingPercentEscapesUsingEncoding : NSUTF8StringEncoding];


@implementation DBContentDateTool

static NSArray *arrays;

+ (void)initDBFilmNetworkWithSearchType:(NSString *)searchType searchName:(NSString *)searchName complete:(void (^)(NSArray *))complete {
    
    NSString *searchUrl = DBSearchURLString(searchType,searchName);
        //转换类型
    NSLog(@"%@",searchUrl);
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    [[AFHTTPSessionManager manager] GET: searchUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            if (searchType == subtypeMovie) {
                arrays = [DBFilm objectArrayWithKeyValuesArray:responseObject[@"subjects"]];
            }
            if (searchType == subtypeBook) {
                arrays = [DBBook objectArrayWithKeyValuesArray:responseObject[@"books"]];
            }
            if (searchType == subtypeMusic) {
                arrays = [DBMusic objectArrayWithKeyValuesArray:responseObject[@"musics"]];
            }
            if (complete) {
                 complete(arrays);
                 [SVProgressHUD dismiss];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
             [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
            NSLog(@"数据加载失败");
        }];
}
@end
