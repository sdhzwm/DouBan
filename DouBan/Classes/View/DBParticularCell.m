//
//  DBParticularCell.m
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//
#define TAG 99
#define tinColor [UIColor colorWithRed:137/255.0 green:129/255.0 blue:69/255.0 alpha:1.0].CGColor
#import "DBParticularCell.h"
#import <UIImageView+WebCache.h>
#import "DBFilm.h"
#import "DBBook.h"
#import "DBMusic.h"
@interface DBParticularCell()

@property (weak, nonatomic) IBOutlet UILabel *radingLabel;
@property (weak, nonatomic) IBOutlet UILabel *filmName;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *missBtn;
@property (weak, nonatomic) IBOutlet UIButton *seeBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@end
@implementation DBParticularCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.mainView.autoresizingMask = UIViewAutoresizingNone;
    self.textView.autoresizingMask = UIViewAutoresizingNone;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = tinColor;
    self.missBtn.layer.borderWidth = 1;
    self.missBtn.layer.borderColor = tinColor;
    self.seeBtn.layer.borderWidth = 1;
    self.seeBtn.layer.borderColor = tinColor;
}
- (void)configureFilm:(DBFilm *)film withIndexPath:(NSIndexPath *)indexPath {
    UIView  *subview = [self.contentView viewWithTag:TAG];
    [subview removeFromSuperview];

    [self.imageView sd_setImageWithURL:film.images[@"large"]];
    
    self.filmName.text = film.title;
    self.radingLabel.text = [NSString stringWithFormat:@"平均:%@分  (%@人看过)",film.rating[@"average"],film.collect_count];
    self.castLabel.text = [self castsArrWithFilm:film];
    self.textView.text = @"想写点影评的，但是貌似没有返回数据，暂时先不写了，以后再找数据啦";
    
}
- (void)setFilm:(DBFilm *)film {
    _film = film;
    UIView  *subview = [self.contentView viewWithTag:TAG];
    [subview removeFromSuperview];
    
    [self.imageView sd_setImageWithURL:film.images[@"large"]];
    
    self.filmName.text = film.title;
    self.radingLabel.text = [NSString stringWithFormat:@"平均:%@分  (%@人看过)",film.rating[@"average"],film.collect_count];
    self.castLabel.text = [self castsArrWithFilm:film];
    self.textView.text = @"想写点影评的，但是貌似没有返回数据，暂时先不写了，以后再找数据啦";
}

- (void)setBook:(DBBook *)book {
    UIView  *subview = [self.contentView viewWithTag:TAG];
    [subview removeFromSuperview];
    [self.imageView sd_setImageWithURL:book.images[@"large"]];
    self.filmName.text = book.title;
    self.radingLabel.text = [NSString stringWithFormat:@"平均:%@分%@人评分",book.rating[@"average"],book.rating[@"numRaters"]];
   // self.castLabel.text = [self castsArrWithFilm:book];
    self.textView.text = book.author_intro;

}

- (void)setMusic:(DBMusic *)music {
    _music = music;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:music.image]];
    self.filmName.text = music.title;
    self.radingLabel.text = [NSString stringWithFormat:@"平均:%@分%@人评分",music.rating[@"average"],music.rating[@"numRaters"]];
    self.textView.text = @"summary这个字段在接口上是有的，可是在返回的时候却没有这个字段，所以即便我很想看下这首歌的介绍，但是也没有什么用。略心痛。。。";

}
- (NSString *)castsArrWithFilm:(DBFilm *)film {
    NSString *casts = @"";
    for(NSDictionary *cast in film.casts) {
        casts = [NSString stringWithFormat:@"%@/%@",casts,cast[@"name"]];
    }
    NSString *string = [NSString stringWithFormat:@"%@/%@",casts,film.year];
    return string;
}
@end
