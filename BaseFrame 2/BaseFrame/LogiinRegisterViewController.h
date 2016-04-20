//
//  LogiinRegisterViewController.h
//  BaseFrame
//
//  Created by yons on 16/4/14.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
@interface LogiinRegisterViewController : MainViewController
@property (nonatomic, strong) LoginViewController *child1;
@property (nonatomic, strong) RegisterViewController *child2;
@property (nonatomic, strong) UIViewController *currentViewController;
@end
