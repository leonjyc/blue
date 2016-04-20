//
//  PassengerTabbarViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/15.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "PassengerTabbarViewController.h"
#import "OrderListViewController.h"
#import "DiscountOrderCarViewController.h"
#import "DiscountListViewController.h"
#import "MePassengerViewController.h"
@interface PassengerTabbarViewController ()

@end

@implementation PassengerTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    OrderListViewController *orderlist = [OrderListViewController new];
    UINavigationController *orderNav = [[UINavigationController alloc] initWithRootViewController:orderlist];
    orderlist.title = @"订单列表";
    DiscountOrderCarViewController *discount = [[DiscountOrderCarViewController alloc] initWithTitles:@[@"公开",@"核心组",@"较好组",@"黑名单组",@"所有"] controllersClass:@[[DiscountListViewController class],[DiscountListViewController class],[DiscountListViewController class],[DiscountListViewController class],[DiscountListViewController class]]];
    UINavigationController *discountNav = [[UINavigationController alloc] initWithRootViewController:discount];
    discountNav.title = @"慧订车";
    MePassengerViewController *me = [MePassengerViewController new];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:me];
    meNav.title = @"个人中心";
    NSArray *arr = @[orderNav,discountNav,meNav];
    self.viewControllers =arr;
    // Do any additional setup after loading the view.
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
