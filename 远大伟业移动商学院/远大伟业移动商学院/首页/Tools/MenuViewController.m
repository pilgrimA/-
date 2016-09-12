//
//  MenuViewController.m
//  远大伟业移动商学院
//
//  Created by YDWY on 16/9/7.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import "MenuViewController.h"
#import "LeftMenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // centerViewController--homeViewController
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tab=[sb instantiateViewControllerWithIdentifier:@"TabBar"];
    
    // leftMenu
    LeftMenuViewController *leftMenu=[LeftMenuViewController new];
    
    // set center and left DrawerViewController
    self.centerViewController=tab;
    self.leftDrawerViewController=leftMenu;
    
    // open and close gestureRecognizer
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    // set leftMenu width
    [self setMaximumLeftDrawerWidth:WIDTH/3*2];
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
