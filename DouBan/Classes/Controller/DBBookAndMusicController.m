//
//  DBBookAndMusicController.m
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//
#define backgroudCloro [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0]
#import "DBBookAndMusicController.h"
#import "DBParticularController.h"
#import "DBBookAndMusicCell.h"
#import "DBContentDateTool.h"
#import "DBConst.h"
#import "DBBook.h"
#import "DBMusic.h"
@interface DBBookAndMusicController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *arrays;
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation DBBookAndMusicController
static NSString * const cellID = @"bookAndMusic";
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置collectionView相关
    [self setupCollectionView];
    //设置数据源,如果是书的话默认搜索一个资源，否则就搜索音乐的资源
    NSString *searchName = self.subType == subtypeBook ?@"q=王小波" :@"q=陈奕迅";
    [self loadDataWithSearchType:self.subType searchName:searchName];
    
}
/**加载数据*/
- (void)loadDataWithSearchType:(NSString *)searchType searchName:(NSString *)searchName{
    __weak typeof(self)weakSelf = self;
    //获取数据
    [DBContentDateTool initDBFilmNetworkWithSearchType:searchType searchName:searchName complete:^(NSArray *arry) {
        weakSelf.arrays = arry;
        [weakSelf.collectionView reloadData];
    }];
}

#pragma mark:数据源及代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%ld",self.arrays.count);
    return self.arrays.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DBBookAndMusicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bookAndMusic" forIndexPath:indexPath];
    if (self.subType == subtypeBook) {
        DBBook *book = self.arrays[indexPath.row];
        NSLog(@"%@",book.title);
        cell.book = book;
    } else if(self.subType == subtypeMusic) {
        DBMusic *music = self.arrays[indexPath.row];
        cell.music = music;
    }
    return cell;
}
//选中cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DBParticularController *particular = [[DBParticularController alloc] init];
    particular.subType = self.subType;
    particular.arrays = self.arrays;
    particular.atIndex = indexPath.row;
    [self.navigationController pushViewController:particular animated:YES];

}
#pragma mark:searchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.text = @"";
    
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
    NSString *searchName = [NSString stringWithFormat:@"q=%@",searchBar.text];
    [self loadDataWithSearchType:self.subType searchName:searchName];
}
//点击搜索框上的 取消按钮时 调用
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchBar.text = @"";
    [self.searchBar resignFirstResponder];
}
#pragma mark: 设置样式
- (void)setupCollectionView {
    //设置searchBar
    self.view.backgroundColor = [UIColor whiteColor];
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(0, 65, self.view.frame.size.width, 24);
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    //设置样式
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(90, 150)];
    [flowLayout setScrollDirection: UICollectionViewScrollDirectionVertical];
    //设置collection
    CGFloat collectionY = CGRectGetMaxY(self.searchBar.frame);
    CGFloat collectionH = self.view.frame.size.height - collectionY+5;
    CGRect frame = CGRectMake(0,collectionY, self.view.frame.size.width, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc]
                                        initWithFrame:frame
                                        collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = backgroudCloro;
    collectionView.contentInset = UIEdgeInsetsMake(10, 10, 20, 10);
    self.collectionView = collectionView;
    
    //注册cell
    UINib *nib = [UINib nibWithNibName:@"DBBookAndMusicCell"
                                bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib
     forCellWithReuseIdentifier:@"bookAndMusic"];
    [self.view addSubview:collectionView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    //设置返回的文字的颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //设置返回按钮的文字
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
}
/**pop方法-->返回*/
- (void)cancel {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
