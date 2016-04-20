//
//  MePassengerViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/15.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "MePassengerViewController.h"
#import "QYTableViewHeader.h"
#import "PayRecordViewController.h"
#import "LogiinRegisterViewController.h"
@interface MePassengerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIImageView* bigImageView;
@property (nonatomic, strong) QYTableViewHeader* headView;
@property (nonatomic, strong) UIImageView* smallView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UILabel *nameLab;
@end

@implementation MePassengerViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = [[NSMutableArray alloc] initWithObjects:@"支付记录", @"在线留言", @"关于软件", @"操作说明", @"蓝水简介",nil];
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)setUI{
    WS(ws);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    _bigImageView.image = [UIImage imageNamed:@"bg.jpg"];
    _bigImageView.clipsToBounds = YES;
    _bigImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _smallView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _smallView.image = [UIImage imageNamed:@"head"];
    _smallView.center = CGPointMake(_bigImageView.center.x, _bigImageView.center.y);
    _smallView.clipsToBounds = YES;
    _smallView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, KScreenWidth, 30)];
    self.nameLab.text = @"HBUNG";
    self.nameLab.textColor = color(whiteColor);
    self.nameLab.font = FONT(15);
    self.nameLab.textAlignment = NSTextAlignmentCenter;
    
    _headView = [[QYTableViewHeader alloc]init];
    _headView.headerTapBlock = ^(void){
        NSLog(@"tap");
        GUAAlertView *alert = [GUAAlertView alertViewWithTitle:@"退出登录" message:@"确认退出" buttonTitle:@"确认" buttonTouchedAction:^{
            [userInfo clearInfo];
            LogiinRegisterViewController *log = [LogiinRegisterViewController new];
            [ws presentViewController:log animated:YES completion:nil];
        } dismissAction:^{
            
        }];
        [alert show];
    };
    [_headView goodMenWithTableView:self.tableView andBackGroundView:_bigImageView andSubviews:_smallView andNameLab:self.nameLab];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    cell.textLabel.textColor = color(grayColor);
    cell.textLabel.font = FONT(15);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *fengge = [[UIView alloc] initWithFrame:CGRectMake(10, 59, KScreenWidth-10, 1)];
    [cell.contentView addSubview:fengge];
    fengge.backgroundColor = color(groupTableViewBackgroundColor);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        PayRecordViewController *pay = [PayRecordViewController new];
        pay.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:pay animated:YES];
    }
}
#pragma mark UISCrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_headView scrollViewDidScroll:scrollView];
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
