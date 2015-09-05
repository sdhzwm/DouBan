//
//  DBBookAndMusicCell.h
//  DouBan
//
//  Created by 王蒙 on 15/9/5.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DBBook;
@class DBMusic;
@interface DBBookAndMusicCell : UICollectionViewCell
@property (strong, nonatomic) DBBook *book;
@property (strong, nonatomic) DBMusic *music;
@end
