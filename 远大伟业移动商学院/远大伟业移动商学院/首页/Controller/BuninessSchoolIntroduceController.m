//
//  BuninessSchoolIntroduceController.m
//  远大伟业移动商学院
//
//  Created by YDWY on 16/9/8.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import "BuninessSchoolIntroduceController.h"
#import "BuninessSchoolCommonController.h"

@interface BuninessSchoolIntroduceController ()

@end

@implementation BuninessSchoolIntroduceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor yellowColor];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(20, 100, 100, 40);
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)click{
    BuninessSchoolCommonController *BSCC=[BuninessSchoolCommonController new];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:BSCC animated:YES];
}

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
