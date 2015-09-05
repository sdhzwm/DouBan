//
//  DBControllerChangeTool.m
//  DouBan
//
//  Created by 王蒙 on 15/9/5.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import "DBControllerChangeTool.h" 
#import "DBFilmController.h"
#import "DBBookAndMusicController.h"
@implementation DBControllerChangeTool

+ (void)controllerChangeToolWithControllerType:(NSUInteger)controllerType {
    //获取到当前的导航控制器
    UINavigationController *nvc = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    switch (controllerType) {
        case DBMusicTypeContoller:{
            DBBookAndMusicController *music = [[DBBookAndMusicController alloc]init];
            music.title = @"音乐";
            music.subType = subtypeMusic;
            [nvc pushViewController:music animated:YES];
            break;
        }
        case DBBookTypeController: {
            DBBookAndMusicController *book = [[DBBookAndMusicController alloc]init];
            book.title = @"图书";
            book.subType = subtypeBook;
            [nvc pushViewController:book animated:YES];
            break;
        }
        case DBFilmTypeController: {
            DBFilmController *vc = [[DBFilmController alloc] init];
            vc.title = @"电影";
            vc.subtype = subtypeMovie;
            [nvc pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
    
}
@end
