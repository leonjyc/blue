//
//  RegisterViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/14.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
{
    UIScrollView *mainscrollView;
    BaseTextField *companyName;//公司名称
    BaseTextField *telephoneTextField;//手机号
    BaseTextField *codeTextField;//验证码
    UIButton *sendCode;//发送验证码
    NSTimer *timer;
    int time;
    NSArray *typeArr;
    NSInteger selectIndex;
    //选择的lab
    NSMutableArray *labArr;
    
    NSString *codeNum;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    time = 120;
    typeArr = @[@"车公司",@"旅行社",@"司机",@"导游",@"乘客"];
    [self setUI];
    selectIndex = 0;
    // Do any additional setup after loading the view.
}
- (void)setUI{
    WS(ws);
    mainscrollView = [UIScrollView new];
    mainscrollView.backgroundColor = backColor;
    [ws.view addSubview:mainscrollView];
    [mainscrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(0,0,0,0));
    }];
    mainscrollView.bounces = YES;
    mainscrollView.scrollEnabled = YES;
    UIView *container = [UIView new];
    [mainscrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(mainscrollView);
        make.edges.equalTo(mainscrollView).with.insets(UIEdgeInsetsMake(60,0,20,0));
    }];
    mainscrollView.showsHorizontalScrollIndicator = NO;
    mainscrollView.showsVerticalScrollIndicator = NO;
    UILabel *titleLab = [[UILabel alloc] init];
    [container addSubview:titleLab];
    titleLab.textColor = color(whiteColor);
    titleLab.text = @"注册";
    titleLab.font = FONT(18);
    titleLab.textAlignment = NSTextAlignmentCenter;
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    companyName = [[BaseTextField alloc] initWithUnderLineColor:color(whiteColor) :30 :KScreenWidth-40];
    [container addSubview:companyName];
    [companyName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(50);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
    }];
    companyName.placeholder = @"单位名称";
    companyName.textColor = color(whiteColor);
    
    
    telephoneTextField = [[BaseTextField alloc] initWithUnderLineColor:color(whiteColor) :30 :KScreenWidth-40];
    [container addSubview:telephoneTextField];
    [telephoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(companyName.mas_bottom).offset(40);
        make.top.equalTo(titleLab.mas_bottom).offset(50).priority(250);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
    }];
    telephoneTextField.placeholder = @"请输入手机号";
    telephoneTextField.textColor = color(whiteColor);
    telephoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    telephoneTextField.delegate = self;
    
    codeTextField = [[BaseTextField alloc] initWithUnderLineColor:color(whiteColor) :30 :KScreenWidth-40];
    [container addSubview:codeTextField];
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
    [sendCode addTarget:self action:@selector(ifExist) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    float w = (KScreenWidth-40)/3;
    UIView *lastView = nil;
    labArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        UIView *subView = [UIView new];
        [container addSubview:subView];
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(w);
            make.left.mas_equalTo(20+(i%3)*w);
            make.height.mas_equalTo(40);
            make.top.equalTo(codeTextField.mas_bottom).offset(40+i/3*50);
        }];
        subView.tag = i;
        subView.userInteractionEnabled = YES;
        UILabel *round = [UILabel new];
        [subView addSubview:round];
        round.backgroundColor = color(whiteColor);
        round.layer.cornerRadius = 8;
        round.layer.masksToBounds = YES;
        [round mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(16);
            make.height.mas_equalTo(16);
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(subView);
        }];
        UILabel *indexRound = [UILabel new];
        [round addSubview:indexRound];
        if (i == 0) {
            indexRound.backgroundColor = color(redColor);
        }
        else {
            indexRound.backgroundColor = color(grayColor);
        }
        indexRound.layer.cornerRadius = 4;
        indexRound.layer.masksToBounds = YES;
        [indexRound mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(8);
            make.height.mas_equalTo(8);
            make.center.mas_equalTo(round);
        }];
        [labArr addObject:indexRound];
        UILabel *name = [UILabel new];
        name.text = typeArr[i];
        name.textColor = color(whiteColor);
        name.font = FONT(15);
//        name.textAlignment = NSTextAlignmentCenter;
        [subView addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(round.mas_right).offset(5);
            make.right.equalTo(subView.mas_right);
            make.top.mas_equalTo(subView);
            make.height.mas_equalTo(subView);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapindex:)];
        [subView addGestureRecognizer:tap];
        lastView = subView;
    }
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [container addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lastView.mas_bottom).offset(40);
        make.centerX.equalTo(container);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
    }];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [loginBtn setTitleColor:backColor forState:UIControlStateNormal];
    loginBtn.titleLabel.font = FONT(16);
    loginBtn.backgroundColor = color(whiteColor);

    [loginBtn addTarget:self action:@selector(postLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(loginBtn.mas_bottom);
    }];

}
- (void)postLogin{
    if (selectIndex == 1) {
        [XHToast showCenterWithText:@"旅行社无需注册" duration:1.5];
    }else{
        if (selectIndex == 0) {
            
        }
        else{
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
    }
}
//注册
- (void)postLoginAction{
    [LBProgressHUD showHUDto:self.view animated:YES];
    NSString *ashx = @"Register.ashx";
    NSDictionary *par = @{@"phone":telephoneTextField.text,@"Type":[NSString stringWithFormat:@"%ld",(long)selectIndex],@"Method":@"Register"};
    [httpPostRequest getDataByPostAshx:ashx and:par withFinishBlock:^(id model, NSError *error) {
        [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
        if (error == nil) {
            NSLog(@"model  %@",[model description]);
            NSString *result = [NSString stringWithFormat:@"%@",[model objectForKey:@"code"]];
            if ([result isEqualToString:@"0"]) {
                [XHToast showCenterWithText:@"注册成功"];
                [self performSelector:@selector(pushToLogin) withObject:nil afterDelay:1.5];
                NSDictionary *dic = @{@"tel":telephoneTextField.text,@"type":[NSString stringWithFormat:@"%ld",(long)selectIndex]};
                [self insertPlist:dic];
            }
            else{
                [XHToast showCenterWithText:@"注册失败"];
            }
            
        }
        else{
            [XHToast showCenterWithText:@"网络连接失败" duration:1.5];
        }
    }];
}
//调到登录
- (void)pushToLogin{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushToLogin"
                                                        object:nil];
}

-(void)tapindex:(UITapGestureRecognizer *)tap{
    selectIndex = tap.view.tag;
    if (selectIndex == 0) {
//        companyName.hidden = NO;
        [companyName mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
        }];
    }
    else{
        [companyName mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
//        companyName.hidden = YES;
    }
    [UIView animateWithDuration:.5f animations:^{
        [self.view layoutIfNeeded];
    }];
    [self changColor:selectIndex];
}
- (void)changColor:(NSInteger)index{
    for (int i = 0; i < labArr.count; i++) {
        UILabel *lab = (UILabel *)labArr[i];
        if (i == index) {
            lab.backgroundColor = color(redColor);
            [lab.layer transitionWithAnimType:TransitionAnimTypeReveal subType:TransitionSubtypesFromLeft curve:TransitionCurveLinear duration:0.5 resultStatus:^(NSString *resultStatus) {
                
            }];
        }
        else{
            lab.backgroundColor = color(grayColor);
        }
    }
}

//判断是否已存在
- (void)ifExist{
    if (selectIndex == 1) {
        [XHToast showCenterWithText:@"旅行社无需注册" duration:1.5];
    }
    else{
        if ([telephoneTextField.text isDigit]) {
            NSString *ashx = @"Register.ashx";
            NSDictionary *par = @{@"phone":telephoneTextField.text,@"Type":[NSString stringWithFormat:@"%ld",(long)selectIndex],@"Method":@"JudgeTel"};
            [LBProgressHUD showHUDto:self.view animated:YES];
            [httpPostRequest getDataByPostAshx:ashx and:par withFinishBlock:^(id model, NSError *error) {
                if (error == nil) {
                    NSLog(@"是否存在  %@",[model description]);
                    NSString *code = [NSString stringWithFormat:@"%@",[model objectForKey:@"code"]];
                    if (![code isEqualToString:@"0"]) {
                        [self showMessage:@"该账户已存在"];
                    }
                    else{
                        [self sendCodeAction];
                    }
                }
                else{
                    [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    [self showMessage:@"网络连接失败"];
                }
            }];
        }
    }
}

- (void)sendCodeAction{
    if (selectIndex == 1) {
        [XHToast showCenterWithText:@"旅行社无需注册" duration:1.5];
    }
    else{
        if ([telephoneTextField.text isDigit]) {
            NSString *ashx = @"Register.ashx";
            NSDictionary *par = @{@"phone":telephoneTextField.text,@"Type":[NSString stringWithFormat:@"%ld",(long)selectIndex],@"Method":@"GetSixRandom"};
            [LBProgressHUD showHUDto:self.view animated:YES];
            [httpPostRequest getDataByPostAshx:ashx and:par withFinishBlock:^(id model, NSError *error) {
                [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
                NSLog(@"model   %@", model);
                if (error == nil) {
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
                        else{
                            [XHToast showCenterWithText:@"验证码发送失败"];
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
