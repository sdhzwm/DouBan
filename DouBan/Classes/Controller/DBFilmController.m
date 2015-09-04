//
//  DBContentsController.m
//  DouBan
//
//  Created by 王蒙 on 15/9/4.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import "DBFilmController.h"
#import "DBContentDateTool.h"
#import "DBFilm.h"
#import "DBContcentCell.h"
#import "DBParticularController.h"
@interface DBFilmController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searBar;
@property (strong, nonatomic) NSArray *arrays;
@property (strong, nonatomic) NSMutableArray *resultArray;
@end

@implementation DBFilmController
static NSString *const cellID = @"DBCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataWithSearchType:self.subtype searchName:@"tag=花儿"];
    [self setupTableView];
}
/**设置tableView*/
- (void)setupTableView {
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DBContcentCell class]) bundle:nil] forCellReuseIdentifier:cellID];
}

/**加载数据*/
- (void)loadDataWithSearchType:(NSString *)searchType searchName:(NSString *)searchName{
    __weak typeof(self)weakSelf = self;
    //获取数据
    [DBContentDateTool initDBFilmNetworkWithSearchType:searchType searchName:searchName complete:^(NSArray *arry) {
        weakSelf.arrays = arry;
        [weakSelf.tableView reloadData];
    }];
}
#pragma mark: 代理以及数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DBContcentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    DBFilm *film = self.arrays[indexPath.row];
    cell.film = film;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    DBParticularController *particulatrController = [[DBParticularController alloc] init];
    particulatrController.arrays = self.arrays;
    particulatrController.atIndex = indexPath.row;
    particulatrController.subType = self.subtype;
    [self.navigationController pushViewController:particulatrController animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}
#pragma mark: 设置导航条
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
    NSString *searchName = [NSString stringWithFormat:@"tag=%@",searchBar.text];
    [self loadDataWithSearchType:self.subtype searchName:searchName];
}
//点击搜索框上的 取消按钮时 调用
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searBar.text = @"";
    [self.searBar resignFirstResponder];
}

@end
