//
//  DBContcentCell.m
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import "DBContcentCell.h"
#import "DBFilm.h"
#import <UIImageView+WebCache.h>
@interface DBContcentCell()
/**小海报的view*/
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
/**电影名称*/
@property (weak, nonatomic) IBOutlet UILabel *filmName;
/**看过的人数*/
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
/**时间以及演员*/
@property (weak, nonatomic) IBOutlet UILabel *castsLabel;
@end
@implementation DBContcentCell
//cell的初始化方法
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void)setFilm:(DBFilm *)film {
    _film = film;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:film.images[@"large"]]];
    self.filmName.text = film.title;
    self.ratingLabel.text = [NSString stringWithFormat:@"平均:%@  (%@人看过)",film.rating[@"average"],film.collect_count];
    self.castsLabel.text = [self castsArr];
}
- (NSString *)castsArr{
    NSString *casts = @"";
    for(NSDictionary *cast in _film.casts) {
        casts = [NSString stringWithFormat:@"%@/%@",casts,cast[@"name"]];
    }
    NSString *string = [NSString stringWithFormat:@"%@/%@",casts,_film.year];
    return string;
}
@end
