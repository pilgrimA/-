//
//  LogInViewController.m
//  MobileBusinessSchool
//
//  Created by YDWY on 16/7/22.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()
{
    UIImageView *imgView; // backgroundView
    UITextField *name;
    UITextField *password;
    UIButton *loginBtn;
}
@end

@implementation LogInViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // build UI
    [self buildUI];
}

- (void)buildUI{
    // set backgroundView
    [self setBackImageView];
    // set user name and password
    [self setUserNameAndPassword];
    // set loginBtn
    [self setLoginBtn];
}

// set backgroundView
- (void)setBackImageView{
    imgView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登录背景"]];
    imgView.frame=self.view.frame;
    imgView.userInteractionEnabled=YES;
    [self.view addSubview:imgView];
}

// set user name and password
- (void)setUserNameAndPassword{
    
}

// set loginBtn
- (void)setLoginBtn{
    loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    loginBtn.frame=CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    [self.view addSubview:loginBtn];
}

// shake
- (void)setShakeAnimation:(UITextField *)textField{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [textField.layer addAnimation:animation forKey:@"shake"];
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
