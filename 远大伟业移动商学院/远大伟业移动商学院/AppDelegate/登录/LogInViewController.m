//
//  LogInViewController.m
//  MobileBusinessSchool
//
//  Created by YDWY on 16/7/22.
//  Copyright © 2016年 YDWY. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()<UITextFieldDelegate>
{
    UIImageView *imgView; // backgroundView
    UIImageView *logoImgView; // logo image
    UITextField *name;
    UITextField *password;
    UIButton *loginBtn;
//    NSUserDefaults *defaults;
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
    // set logo
    [self setLogo];
    // set user name and password
    [self setUserNameAndPassword];
    // set delegate
    [self setTextDelegate];
    // set loginBtn
    [self setLoginBtn];
}

// set logo
- (void)setLogo{
    // logo
    logoImgView=[[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/4.0, (HEIGHT/5.0*2-WIDTH/2.0)/2, WIDTH/2.0, WIDTH/2.0)];
    logoImgView.image=[UIImage imageNamed:@"login_logo1"];
    // image setting
    logoImgView.layer.masksToBounds=YES;
    logoImgView.layer.cornerRadius=WIDTH/4.0;
    [self.view addSubview:logoImgView];
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
    for (int i=0; i<2; i++) {
        UITextField *textfield=[[UITextField alloc] initWithFrame:CGRectMake(40, HEIGHT/5.0*2+i*60, WIDTH-80, 40)];
        UIImageView *iconImg=[[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 20, 30)];
        textfield.backgroundColor=[UIColor clearColor];
        switch (i) {
            case 0:
                name=textfield;
                name.placeholder=@"请输入账号(please enter username)";
                iconImg.image=[UIImage imageNamed:@"login_user"];
                break;
            case 1:
                password=textfield;
                password.placeholder=@"请输入密码(please enter password)";
                password.secureTextEntry=YES;
                iconImg.image=[UIImage imageNamed:@"login_password"];
                break;
            default:
                break;
        }
        textfield.leftView=iconImg;
        textfield.leftViewMode=UITextFieldViewModeAlways;
        textfield.layer.masksToBounds=YES;
        textfield.layer.cornerRadius=5;
        [self.view addSubview:textfield];
    }
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

- (void)setTextDelegate{
    name.delegate=self;
    password.delegate=self;
    if ([name canBecomeFirstResponder] || [password canBecomeFirstResponder]) {
        [self performSelector:@selector(showKeyboard) withObject:nil afterDelay:0];
    }
}

// 弹出键盘
- (void)showKeyboard{
    [name becomeFirstResponder];
    [password becomeFirstResponder];
}

//  回收键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
