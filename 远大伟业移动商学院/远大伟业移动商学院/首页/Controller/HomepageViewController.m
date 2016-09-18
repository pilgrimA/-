//
//  HomepageViewController.m
//  远大伟业移动商学院
//
//  Created by YDWY on 16/9/2.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import "HomepageViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "BuninessSchoolIntroduceController.h"

@interface HomepageViewController ()

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // setting leftMenu
    [self setLeftMenu];
}

// setting leftMenu
- (void)setLeftMenu{
    UIBarButtonItem *item1=[[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:self action:@selector(openLeftMenu)];
    UIBarButtonItem *item2=[[UIBarButtonItem alloc] initWithTitle:@"Introduce" style:UIBarButtonItemStyleDone target:self action:@selector(BuninessSchoolIntroduce)];
    self.navigationItem.leftBarButtonItems=@[item1,item2];
}

// open leftMenu
- (void)openLeftMenu{
    [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

// Buniness School Introduce
- (void)BuninessSchoolIntroduce{
    BuninessSchoolIntroduceController *BSIC=[BuninessSchoolIntroduceController new];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:BSIC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    
}

// 新闻轮播图（横向）

// 新闻轮播图（纵向）


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
