//
//  LoginViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/13.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "LoginViewController.h"
#import "PassengerTabbarViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
{
    BaseTextField *telephoneTextField;//手机号
    BaseTextField *codeTextField;//验证码
    UIButton *sendCode;//发送验证码
    NSTimer *timer;
    int time;
    NSString *codeNum;
    NSString *typeNum;
}
@end

@implementation LoginViewController
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
//    [timer invalidate];
//    timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    time = 120;
    self.view.backgroundColor = backColor;
    [self setUI];
   
    // Do any additional setup after loading the view.
}

- (void)setUI{
    WS(ws);
    UIView *logView = [[UIView alloc] init];
    //    logView.backgroundColor = RandomColor;
    [self.view addSubview:logView];
    [logView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(KScreenWidth);
        make.height.mas_equalTo(320);
        make.center.equalTo(ws.view);
    }];
    
    UILabel *titleLab = [[UILabel alloc] init];
    [logView addSubview:titleLab];
    titleLab.textColor = color(whiteColor);
    titleLab.text = @"登录";
    titleLab.font = FONT(18);
    titleLab.textAlignment = NSTextAlignmentCenter;
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    telephoneTextField = [[BaseTextField alloc] initWithUnderLineColor:color(whiteColor) :30 :KScreenWidth-40];
    [logView addSubview:telephoneTextField];
    [telephoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(50);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
    }];
    telephoneTextField.placeholder = @"请输入手机号";
    telephoneTextField.textColor = color(whiteColor);
    telephoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    telephoneTextField.delegate = self;
    
    codeTextField = [[BaseTextField alloc] initWithUnderLineColor:color(whiteColor) :30 :KScreenWidth-40];
    [logView addSubview:codeTextField];
    [codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(telephoneTextField.mas_bottom).offset(40);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
    }];
    codeTextField.placeholder = @"验证码";
    codeTextField.textColor = color(whiteColor);
    codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    codeTextField.delegate = self;
    
    //发送验证码
    sendCode = [[UIButton alloc] init];
    [codeTextField addSubview:sendCode];
    [sendCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(30);
        make.right.equalTo(codeTextField.mas_right);
        make.top.equalTo(codeTextField.mas_top);
    }];
    [sendCode setTitleColor:color(whiteColor) forState:UIControlStateNormal];
    [sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    sendCode.titleLabel.font = FONT(15);
    [sendCode addTarget:self action:@selector(sendCodeAction) forControlEvents:UIControlEventTouchUpInside];
    
    //竖线
    UIView *shuxian = [[UIView alloc] init];
    shuxian.backgroundColor = color(whiteColor);
    [codeTextField addSubview:shuxian];
    [shuxian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(20);
        make.top.equalTo(codeTextField.mas_top).offset(5);
        make.right.equalTo(sendCode.mas_left);
    }];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [logView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeTextField.mas_bottom).offset(40);
        make.centerX.equalTo(logView);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
    }];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:backColor forState:UIControlStateNormal];
    loginBtn.titleLabel.font = FONT(16);
    loginBtn.backgroundColor = color(whiteColor);
    [loginBtn addTarget:self action:@selector(pushToDiffTabbar) forControlEvents:UIControlEventTouchUpInside];
}
//登录跳转不同界面
-(void)pushToDiffTabbar{
    if (![telephoneTextField.text isDigit]) {
        [XHToast showCenterWithText:@"请正确输入手机号" duration:1.5];
        return;
    }
    if (codeTextField.text.length == 0) {
        [XHToast showCenterWithText:@"请输入验证码" duration:1.5];
        return;
    }
    if (![codeTextField.text isEqualToString:codeNum]){
        [XHToast showCenterWithText:@"验证码错误" duration:1.5];
        return;
    }
    [self postLoginAction];

}
- (void)postLoginAction{
    NSString *ashx = @"LoginUserInfo.ashx";
    NSDictionary *par = @{@"Tel":telephoneTextField.text};
    [LBProgressHUD showHUDto:self.view animated:YES];
    [httpPostRequest getDataByPostAshx:ashx and:par withFinishBlock:^(id model, NSError *error) {
        [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
        if (error == nil) {
            NSLog(@"登录信息  %@", [model description]);
            NSString *code = [NSString stringWithFormat:@"%@",[model objectForKey:@"code"]];
            if ([code isEqualToString:@"0"]) {
                NSArray *data = [model objectForKey:@"data"];
                if (data.count > 0) {
                    NSDictionary *dic = data[0];
                    NSString *userType = [NSString stringWithFormat:@"%@",[dic objectForKey:@"USerType"]];
                    userInfo *info = [[userInfo alloc] init];
                    [info setUserInfoDic:dic];
                    [self showMessage:@"登陆成功"];
                    [self performSelector:@selector(pushDiff:) withObject:userType afterDelay:1.5];
                }
                else{
                    [self showMessage:@"登录失败"];
                }
            }
            else{
                [self showMessage:@"登录失败"];
            }
        }
        else{
            [self showMessage:@"网络连接失败"];
        }
    }];
}

- (void)pushDiff:(NSString *)USerType{
    //值是1 返回的是车公司 ，2 是旅行社，3是司机，4是导游，5是乘客
    switch ([USerType intValue]) {
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            //乘客
            [self pushtoChengke];
        }
            break;
            
        default:
            break;
    }
}

- (void)pushtoChengke{
    dispatch_async(dispatch_get_main_queue(), ^
                   
   {
       PassengerTabbarViewController *t = [[PassengerTabbarViewController alloc] init];
       t.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
       [self presentViewController:t animated:YES completion:nil];
       //跳转界面
   });
    
}


- (void)sendCodeAction{
    if ([telephoneTextField.text isDigit]) {
        //尝试从本地取type
//        typeNum = [self getTypeFromePlist:telephoneTextField.text];
        NSString *ashx = @"LoginAPI.ashx";
        NSMutableDictionary *par = [[NSMutableDictionary alloc] init];
        [par setObject:telephoneTextField.text forKey:@"Tel"];
        
        [LBProgressHUD showHUDto:self.view animated:YES];
        [httpPostRequest getDataByPostAshx:ashx and:par withFinishBlock:^(id model, NSError *error) {
            [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
            if (error == nil) {
                 NSLog(@"登录验证码信息  %@", [model description]);
                NSString *code = [NSString stringWithFormat:@"%@",[model objectForKey:@"code"]];
                if ([code isEqualToString:@"0"]) {
                    [XHToast showCenterWithText:@"验证码发送成功" duration:1.5];
                    NSArray *data = [model objectForKey:@"data"];
                    if (data.count > 0) {
                        NSDictionary *dic = data[0];
                        codeNum = [NSString stringWithFormat:@"%@",[dic objectForKey:@"CodeNum"]];
                        NSLog(@"codeNum  %@",codeNum);
                        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeMethod:) userInfo:nil repeats:YES];
                        [sendCode setTitleColor:color(grayColor) forState:UIControlStateNormal];
                        sendCode.userInteractionEnabled = NO;
                        [codeTextField becomeFirstResponder];
                    }
                }
                else{
                    [XHToast showCenterWithText:@"验证码发送失败"];
                }
            }
            else{
                [XHToast showCenterWithText:@"网络连接失败"];
            }
        }];
    }
    else{
        [XHToast showCenterWithText:@"请正确输入手机号" duration:1.5];
    }
}
- (void)timeMethod:(NSTimer *)tm{
    time --;
    [sendCode setTitle:[NSString stringWithFormat:@"%d s",time] forState:UIControlStateNormal];
    if (time == 0) {
        [tm invalidate];
        timer = nil;
        time = 120;
        [sendCode setTitle:@"发送验证码" forState:UIControlStateNormal];
        [sendCode setTitleColor:color(whiteColor) forState:UIControlStateNormal];
        sendCode.userInteractionEnabled = YES;
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == telephoneTextField) {
        if (range.location >= 11) return NO;
    }
    else{
        if (range.location >= 6) return NO;
    }
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.view.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:1 resultStatus:^(NSString *resultStatus) {
//        
//    }];
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
