//
//  DBBookViewController.m
//  DBAPP
//
//  Created by 王蒙 on 15/9/5.
//  Copyright (c) 2015年 王蒙. All rights reserved.
//

#import "DBRootController.h"
#import "EFAnimationViewController.h"
@interface DBRootController ()
@property (nonatomic, strong) EFAnimationViewController *viewController;
@end

@implementation DBRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载对应的控制器
    self.viewController = ({
        EFAnimationViewController *viewController = [[EFAnimationViewController alloc] init];
        [self.view addSubview:viewController.view];
        [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
        viewController;
    });
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)dealloc {
    [_viewController.view removeFromSuperview];
    [_viewController removeFromParentViewController];
}
@end
