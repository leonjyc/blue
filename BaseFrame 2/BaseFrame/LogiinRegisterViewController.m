//
//  LogiinRegisterViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/14.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "LogiinRegisterViewController.h"

@interface LogiinRegisterViewController ()
{
    NSInteger logShow; //显示注册或登录
    UIButton *chooseType;
}
@end

@implementation LogiinRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.child1 = [LoginViewController new];
    [self addChildViewController:self.child1];
    [self.child1.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 0)];
    //    self.title = @"首页";
    [self.view addSubview:self.child1.view];
    self.currentViewController = self.child1;
    self.child2 = [RegisterViewController new];
    [self addChildViewController:self.child2];
    [self.child2.view setFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-0)];
    logShow = 1;
    
    chooseType = [[UIButton alloc] init];
    [self.view addSubview:chooseType];
    chooseType.layer.cornerRadius = 5;
    chooseType.layer.borderColor = color(whiteColor).CGColor;
    chooseType.layer.borderWidth = 1;
    [chooseType setTitle:@"注册" forState:UIControlStateNormal];
    chooseType.titleLabel.font = FONT(15);
    [chooseType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(25);
    }];
    [chooseType addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToLogin) name:@"pushToLogin" object:nil];
    // Do any additional setup after loading the view.
}

- (void)pushToLogin{
    [self change:chooseType];
}

- (void)change:(UIButton *)btn{
    if (logShow == 1) {
        logShow = 2;
        [btn setTitle:@"登录" forState:UIControlStateNormal];
    }
    else{
        logShow = 1;
        [btn setTitle:@"注册" forState:UIControlStateNormal];
    }
    [self setTabBarViewIndex:logShow];
}

- (void)setTabBarViewIndex:(NSInteger)index{
    if ((self.currentViewController == self.child1 && index == 1) ||
        (self.currentViewController == self.child2 && index == 2) ) {
        return;
    }
    //    self.title = [listArr objectAtIndex:index-1];
    switch (index) {
        case 1:
        {
            [self transitionFromViewController:self.currentViewController toViewController:self.child1 duration:0.5 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            }  completion:^(BOOL finished) {

                self.currentViewController = self.child1;

            }];
        }
            break;
        case 2:
        {
            
            [self transitionFromViewController:self.currentViewController toViewController:self.child2 duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
            }  completion:^(BOOL finished) {

                self.currentViewController = self.child2;

            }];
            
            
        }
            break;
                    break;
        default:
            break;
    }
    [self.view bringSubviewToFront:chooseType];
    [self.view sendSubviewToBack:self.currentViewController.view];
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
