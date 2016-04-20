//
//  OrderListViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/14.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "OrderListViewController.h"
#import "QYTableViewHeader.h"
#import "ParallaxHeaderView.h"
#import "OrderListModel.h"
#import "OrderListTableViewCell.h"
#import "OrderDetailViewController.h"
@interface OrderListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)QYTableViewHeader* headView;
@property(nonatomic,strong)UIImageView* bigImageView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *resultArr;//接口返回结果
@end

@implementation OrderListViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self loadNewData];
    // Do any additional setup after loading the view.
}
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
        
        int titleTotalLength = (int)[[self titleAll] length];
        int descTotalLength = (int)[[self descAll] length];
        for (int i = 0; i < 40; ++i) {
            int titleLength = rand() % titleTotalLength + 15;
            if (titleLength > titleTotalLength - 1) {
                titleLength = titleTotalLength;
            }
            
            OrderListModel *model = [[OrderListModel alloc] init];

            
            int descLength = rand() % descTotalLength + 20;
            if (descLength >= descTotalLength) {
                descLength = descTotalLength;
            }
            model.uid = i + 1;
            model.address = [[self titleAll] substringToIndex:titleLength];
            model.time = [[self descAll] substringToIndex:descLength];
            model.orderNo = @"1123654654564";
            model.note1 = @"11";
            model.note2 = @"22";
            [_dataSource addObject:model];
        }
    }
    
    return _dataSource;
}

- (NSString *)titleAll {
    return @"欢迎使用HYBMasonryAutoCellHeight扩展，由作者huangyibiao提供，如有任何疑问，请给作者发email：huangyibiao520@163.com，谢谢您的支持！！！";
}

- (NSString *)descAll {
    return @"HYBMasonryAutoCellHeight是基于Masonry第三方开源库而实现的，如想更深入了解Masonry，可直接到github上的官方文档阅读，或可以到作者的博客中阅读相关文章：http://www.hybblog.com/masonryjie-shao/，如果阅读时有疑问，可直接联系作者（email或者QQ），最直接的方式就是在文章后面留言，作者会在收到反馈后的第一时间迅速查看，并给予相应的回复。欢迎留言，希望我们能成为朋友。";
}
- (void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.dataVerticalOffset = 50;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView gzwLoading:^{
        [self loadNewData];
    }];
    
    _bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    _bigImageView.image = [UIImage imageNamed:@"bg.jpg"];
    _bigImageView.clipsToBounds = YES;
    _bigImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIImageView* smallView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    smallView.image = nil;
    smallView.center = CGPointMake(_bigImageView.center.x, _bigImageView.center.y);
    smallView.clipsToBounds = YES;
    smallView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    _headView = [[QYTableViewHeader alloc]init];
    [_headView goodMenWithTableView:self.tableView andBackGroundView:_bigImageView andSubviews:smallView andNameLab:nil];
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
//    // 马上进入刷新状态
//    [header beginRefreshing];
    
    // 设置header
    self.tableView.mj_header = header;
}

//下拉刷新
- (void)loadNewData{
    NSString *ashx = @"CustS/CustHandler.ashx";
    NSString *userID = [userInfo getUserID];
    NSDictionary *par = @{@"cId":userID};
    self.tableView.loading = YES;
    [httpPostRequest getDataByPostAshx:ashx and:par withFinishBlock:^(id model, NSError *error) {
        if (error == nil) {
            NSLog(@"订单信息  %@",[model description]);
            NSString *code = [NSString stringWithFormat:@"%@",[model objectForKey:@"code"]];
            if ([code isEqualToString:@"0"]) {
                self.resultArr = [[NSMutableArray alloc] initWithArray:[model objectForKey:@"data"]];
                if (self.resultArr.count == 0) {
                    [self.tableView setDescriptionText:@"您还没有订单"];
                }
            }
            else{
                [self showMessage:@"获取列表信息失败"];
            }
        }
        else{
            [self.tableView setDescriptionText:@"网络连接失败"];
            [self showMessage:@"网络连接失败"];
        }
        self.tableView.loading = NO;
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (CGRect)buttonFrame{
    return CGRectMake(KScreenWidth/2, KScreenHeight/2, 1, 1);
}

#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    OrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[OrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    OrderListModel *model = nil;
    if (indexPath.section < self.dataSource.count) {
        model = [self.dataSource objectAtIndex:indexPath.section];
    }
    [cell configCellWithModel:model];
    

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.resultArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderListModel *model = nil;
    if (indexPath.section < self.dataSource.count) {
        model = [self.dataSource objectAtIndex:indexPath.section];
    }
    
    
    return [OrderListTableViewCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        OrderListTableViewCell *cell = (OrderListTableViewCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetailViewController *detail = [OrderDetailViewController new];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
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
