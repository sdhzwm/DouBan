//
//  DBParticularController.m
//  DouBan
//
//  Created by 王蒙 on 15/9/5.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//页面详情
#define backgroudColor [UIColor colorWithRed:202/255.0 green:233/255.0 blue:242/255.0 alpha:1.0]
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
    [self setupCollectionView];
}
#pragma mark :数据源以及代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.arrays.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DBParticularCell *cell = (DBParticularCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ParticularCell" forIndexPath:indexPath];
    if (self.subType == subtypeMovie) {
        DBFilm *film = self.arrays[indexPath.section];
        cell.film = film;
    }
    if (self.subType == subtypeBook) {
        DBBook *book = self.arrays[indexPath.section];
        cell.book = book;
    }
    if (self.subType == subtypeMusic) {
        DBMusic *music = self.arrays[indexPath.section];
        cell.music = music;
    }
    return cell;
}
#pragma mark: 基础设置
- (void)setupCollectionView{
    self.title = @"详情页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    RGCardViewLayout *layout = [[RGCardViewLayout alloc] init];
    CGRect frame = self.view.frame;
    UICollectionView *collectionView = [[UICollectionView alloc]
                                        initWithFrame:frame
                                        collectionViewLayout:layout];
    
    collectionView.backgroundColor = backgroudColor;
    UINib *nib = [UINib nibWithNibName:@"DBParticularCell"
                                bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib
     forCellWithReuseIdentifier:@"ParticularCell"];
    collectionView.pagingEnabled = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *index = [NSIndexPath indexPathForItem:0 inSection:self.atIndex];
    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}
@end
