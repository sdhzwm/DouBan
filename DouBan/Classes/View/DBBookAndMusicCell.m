//
//  DBBookAndMusicCell.m
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import "DBBookAndMusicCell.h"
#import "DBBook.h"
#import "DBMusic.h"
#import <UIImageView+WebCache.h>
@interface DBBookAndMusicCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *titleGrade;

@end
@implementation DBBookAndMusicCell

- (void)setBook:(DBBook *)book {
    _book = book;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:book.images[@"small"]]];
    self.titleName.text = book.title;
    self.titleGrade.text = [NSString stringWithFormat:@"平均:%@分",book.rating[@"average"]];
}

- (void)setMusic:(DBMusic *)music {
    _music = music;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:music.image]];
    self.titleName.text = music.title;
    self.titleGrade.text = [NSString stringWithFormat:@"平均:%@分",music.rating[@"average"]];
}
@end
