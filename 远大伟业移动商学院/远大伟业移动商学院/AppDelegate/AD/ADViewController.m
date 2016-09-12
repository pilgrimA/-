//
//  ADViewController.m
//  远大伟业移动商学院
//
//  Created by YDWY on 16/9/8.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import "ADViewController.h"
#import "DrawCircleProgressButton.h"
#import "AppDelegate.h"

@interface ADViewController ()

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawCircleProgressButton *drawCircleView=[[DrawCircleProgressButton alloc] initWithFrame:CGRectMake(WIDTH-55, 30, 40, 40)];
    drawCircleView.lineWidth = 2;
    [drawCircleView setTitle:@"跳过" forState:UIControlStateNormal];
    [drawCircleView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    drawCircleView.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [drawCircleView addTarget:self action:@selector(removeProgress) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  progress 完成时候的回调
     */
    __weak ADViewController *weakSelf = self;
    [drawCircleView startAnimationDuration:5 withBlock:^{
        [weakSelf removeProgress];
    }];
    
    [self.view addSubview:drawCircleView];
}

- (void)removeProgress
{
    AppDelegate *appDelegate=[UIApplication sharedApplication].delegate;
    UITabBarController *tab=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TabBar"];
    self.imageView.transform = CGAffineTransformMakeScale(1, 1);
    self.imageView.alpha = 1;
    
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.alpha = 0.05;
        self.imageView.transform = CGAffineTransformMakeScale(5, 5);
        appDelegate.window.rootViewController=tab;
    } completion:^(BOOL finished) {
        [self.imageView removeFromSuperview];
    }];
}

// AD image
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _imageView.image = [UIImage imageNamed:@"launch_image.jpg"];
    }
    return _imageView;
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
