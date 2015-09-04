//
//  DBParticularController.m
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//页面详情
#import "DBParticularController.h"
#import "DBParticularCell.h"
#import "DBFilm.h"
#import "DBMusic.h"
#import "DBBook.h"
#import "DBConst.h"
#import "RGCardViewLayout.h"

@interface DBParticularController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) UICollectionView *collectionView;
@end
@implementation DBParticularController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情页面";
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)setupCollectionView{
   
    RGCardViewLayout *layout = [[RGCardViewLayout alloc] init];
    CGRect frame = self.view.frame;
    UICollectionView *collectionView = [[UICollectionView alloc]
                                        initWithFrame:frame
                                        collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    UINib *nib = [UINib nibWithNibName:@"DBParticularCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"ParticularCell"];
    collectionView.pagingEnabled = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), CGRectGetHeight(self.collectionView.frame));
    [self.collectionView reloadData];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupCollectionView];

    NSIndexPath *index = [NSIndexPath indexPathForItem:0 inSection:self.atIndex];
    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}
#pragma mark :数据源以及代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSLog(@"%ld",self.arrays.count);
    return self.arrays.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DBParticularCell *cell = (DBParticularCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ParticularCell" forIndexPath:indexPath];
    if (self.subType == subtypeMovie) {
        DBFilm *film = self.arrays[indexPath.section];
        cell.film = film;
       // [cell configureFilm:film withIndexPath:indexPath];
    }
    if (self.subType == subtypeBook) {
        DBBook *book = self.arrays[indexPath.section];
        cell.book = book;
       // [cell configureFilm:book withIndexPath:indexPath];
    }
    if (self.subType == subtypeMusic) {
        DBMusic *music = self.arrays[indexPath.section];
        cell.music = music;
       // [cell configureFilm:music withIndexPath:indexPath];
    }
    
    return cell;
}
@end
