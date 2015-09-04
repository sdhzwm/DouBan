//
//  DBParticularCell.h
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DBFilm;
@class DBMusic;
@class DBBook;
@interface DBParticularCell : UICollectionViewCell

@property(strong, nonatomic)DBBook *book;
@property(strong, nonatomic)DBMusic *music;
@property(strong, nonatomic)DBFilm *film;
- (void)configureFilm:(DBFilm *)film withIndexPath:(NSIndexPath *)indexPath;
@end
