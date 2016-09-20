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
    UIActivityIndicatorView *activityIndicator; // activity Indicator
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
                name.placeholder=@"请输入账号";
                iconImg.image=[UIImage imageNamed:@"login_user"];
                break;
            case 1:
                password=textfield;
                password.placeholder=@"请输入密码";
                password.secureTextEntry=YES;
                iconImg.image=[UIImage imageNamed:@"login_password"];
                break;
            default:
                break;
        }
        textfield.leftView=iconImg;
        textfield.leftViewMode=UITextFieldViewModeAlways;
        [self setBorderWidthandColorInObject:textfield];
        [self.view addSubview:textfield];
    }
}

// set loginBtn
- (void)setLoginBtn{
    loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录中···" forState:UIControlStateSelected];
    [self setBorderWidthandColorInObject:loginBtn];
    loginBtn.frame=CGRectMake(40, HEIGHT/5.0*2+120, WIDTH-80, 40);
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    [self setActivityIndicator];
}

// login
- (void)login:(UIButton *)sender{
    loginBtn.selected=!loginBtn.selected;
    if (loginBtn.selected) {
        [self recoveryKeyBoard];
        // 登录过程中
        [activityIndicator startAnimating];
        // 账号或密码错误-message
        [self setShakeAnimation:name];
        [self setShakeAnimation:password];
        NSLog(@"login-ing");
    }else{
        // 登录结束
        
    }
}

// set uicontrol's borderWidth and borderColor
- (void)setBorderWidthandColorInObject:(UIControl *)object{
    object.layer.borderWidth=1.0f;
    object.layer.borderColor=[UIColor whiteColor].CGColor;
    object.layer.masksToBounds=YES;
    object.layer.cornerRadius=5.0f;
}

// get request data
- (void)requestURL{
    
}

// shake if wrong
- (void)setShakeAnimation:(UITextField *)textField{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [textField.layer addAnimation:animation forKey:@"shake"];
}

// set text delegate
- (void)setTextDelegate{
    name.delegate=self;
    password.delegate=self;
    if ([name canBecomeFirstResponder] || [password canBecomeFirstResponder]) {
        [self performSelector:@selector(showKeyboard) withObject:nil afterDelay:0];
    }
}

// set activityIndicator
- (void)setActivityIndicator{
    activityIndicator=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(20, 0, 40, 40)];
    activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhite;
    [loginBtn addSubview:activityIndicator];
}

// eject keyboard
- (void)showKeyboard{
    [name becomeFirstResponder];
    [password becomeFirstResponder];
}

//  recovery keyboard
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

// recovery keyboard
- (void)recoveryKeyBoard{
    if ([name isFirstResponder]) {
        [name resignFirstResponder];
    }else if ([password isFirstResponder]){
        [password resignFirstResponder];
    }
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
