//
//  OrderDetailViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/16.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "OrderDetailViewController.h"
@interface OrderDetailViewController ()<UIGestureRecognizerDelegate>
{
    UIScrollView *MainscrollView;
    UILabel *titleText;//标题
    LeftTitleTextField *lvxingshe;//旅行社
    LeftTitleTextField *startTime;//开始时间
    LeftTitleTextField *endTime;//结束时间
    LeftTitleTextField *getonCar;//上车
    LeftTitleTextField *getoffCar;//下车
    LeftTitleTextField *priceText;//价格
    UIButton *payBtn;//支付
    
    //司机信息
    UILabel *driverName; //姓名
    UILabel *drivePhone; //电话
    LeftTitleTextField *carType;//车类型
    LeftTitleTextField *sitesNum; //座位数
    UIButton *driverNotes;//司机留言
    
    //导游信息
    LeftTitleTextField *guideName;  //导游姓名
    UILabel *guidePhone; //电话
    LeftTitleTextField *guideGps;//位置信息
    UIButton *guideNotes;//司机留言
    
    //路线信息
    UILabel *routeInfo;
    
}
@end
@implementation OrderDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    self.view.backgroundColor = color(whiteColor);
    [self setUI];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    WS(ws);
    self.navigationController.interactivePopGestureRecognizer.delegate = ws;
    //判断是否为第一个view
    if (self.navigationController && [self.navigationController.viewControllers count] == 1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
#pragma mark- UIGestureRecognizerDelegate
//**************方法一****************//
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}



//绘制界面
- (void)setUI{
    WS(ws);
    float padding = 5;
    float height = 25;
    UIColor *textColor = color(grayColor);
    MainscrollView = [[UIScrollView alloc] init];
    [self.view addSubview:MainscrollView];
    [MainscrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(64,0,0,0));
    }];
    MainscrollView.bounces = YES;
    MainscrollView.scrollEnabled = YES;
    //scrollview中间的view
    UIView *container = [UIView new];
    [MainscrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(MainscrollView);
        make.edges.equalTo(MainscrollView).with.insets(UIEdgeInsetsMake(0,0,0,0));
    }];

    //标题
    titleText = [[UILabel alloc] init];
    titleText.font = FONT(16);
    titleText.text = @"苏州---西塘";
    [container addSubview:titleText];
    [titleText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //旅行社
    lvxingshe = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"旅行社"];
    [lvxingshe hideUnderLine];
    [lvxingshe setEnabled:NO];
    lvxingshe.text = @"涵邦旅游";
    lvxingshe.textColor = textColor;
    [container addSubview:lvxingshe];
    [lvxingshe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //开始时间
    startTime = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"开始时间"];
    [startTime hideUnderLine];
    [startTime setEnabled:NO];
    startTime.text = @"涵邦旅游";
    startTime.textColor = textColor;
    [container addSubview:startTime];
    [startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lvxingshe.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //结束时间
    endTime = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"结束时间"];
    [endTime hideUnderLine];
    [endTime setEnabled:NO];
    endTime.text = @"涵邦旅游";
    endTime.textColor = textColor;
    [container addSubview:endTime];
    [endTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startTime.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //上车地点
    getonCar = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"上车地点"];
    [getonCar hideUnderLine];
    [getonCar setEnabled:NO];
    getonCar.text = @"涵邦旅游";
    getonCar.textColor = textColor;
    [container addSubview:getonCar];
    [getonCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(endTime.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //下车地点
    getoffCar = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"下车地点"];
    [getoffCar hideUnderLine];
    [getoffCar setEnabled:NO];
    getoffCar.text = @"涵邦旅游";
    getoffCar.textColor = textColor;
    [container addSubview:getoffCar];
    [getoffCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(getonCar.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //价格
    priceText = [[LeftTitleTextField alloc] initWithUnderLineColor:color(blackColor) height:height width:KScreenWidth-30 title:@"价格"];
    [priceText hideUnderLine];
    [priceText setEnabled:NO];
    priceText.text = @"涵邦旅游";
    priceText.textColor = color(redColor);
    [container addSubview:priceText];
    [priceText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(getoffCar.mas_bottom).offset(padding*2);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //支付
    payBtn = [[UIButton alloc] init];
    payBtn.layer.cornerRadius = 5;
    [container addSubview:payBtn];
    payBtn.backgroundColor = backColor;
    [payBtn setTitle:@"立即支付" forState:UIControlStateNormal];
    [payBtn setTitleColor:color(whiteColor) forState:UIControlStateNormal];
    payBtn.titleLabel.font = FONT(15);
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(getoffCar.mas_bottom).offset(padding*2-5);
        make.width.mas_equalTo(80);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(30);
    }];
    
    //线路司机信息
    UILabel *lab1 = [UILabel new];
    [container addSubview:lab1];
    lab1.text = @"     线路司机信息";
    lab1.font = FONT(15);
    lab1.textColor = color(grayColor);
    lab1.backgroundColor = color(groupTableViewBackgroundColor);
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(payBtn.mas_bottom).offset(30);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    //司机姓名
    driverName = [[UILabel alloc] init];
    [container addSubview:driverName];
    driverName.font = FONT(15);
    driverName.textColor = color(grayColor);
    driverName.text = @"司机姓名";
    [driverName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab1.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //司机留言
    driverNotes = [[UIButton alloc] init];
    driverNotes.backgroundColor = RandomColor;
    [container addSubview:driverNotes];
    [driverNotes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
        make.top.equalTo(lab1.mas_bottom).offset(padding);
    }];
    
    [driverNotes setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [driverNotes setTitle:@"留言" forState:UIControlStateNormal];
    [driverNotes setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    driverNotes.imageEdgeInsets = UIEdgeInsetsMake(0,20,30,0);
    driverNotes.titleLabel.font = FONT(14);
    driverNotes.titleEdgeInsets = UIEdgeInsetsMake(30, 0, 10, 0);
    driverNotes.titleLabel.textAlignment = NSTextAlignmentCenter;
    driverNotes.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //设置button的内容横向居中。。设置content是title和image一起变化
    
    //电话
    drivePhone = [UILabel new];
    [container addSubview:drivePhone];
    drivePhone.textColor = color(blackColor);
    drivePhone.text = @"123456789";
    drivePhone.font = FONT(15);
    [drivePhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(driverName.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    //车类型
    carType = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:height width:KScreenWidth-30 title:@"车辆类型"];
    [carType hideUnderLine];
    [container addSubview:carType];
    carType.textColor = color(grayColor);
    carType.text = @"大巴";
    carType.font = FONT(15);
    [carType setEnabled:NO];
    [carType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(drivePhone.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    //座位数
    sitesNum = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:height width:KScreenWidth-30 title:@"座位数"];
    [sitesNum hideUnderLine];
    [container addSubview:sitesNum];
    sitesNum.textColor = color(grayColor);
    sitesNum.text = @"60";
    sitesNum.font = FONT(15);
    [sitesNum setEnabled:NO];
    [sitesNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(carType.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //线路导游信息
    UILabel *lab2 = [UILabel new];
    [container addSubview:lab2];
    lab2.text = @"     线路导游信息";
    lab2.font = FONT(15);
    lab2.textColor = color(grayColor);
    lab2.backgroundColor = color(groupTableViewBackgroundColor);
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sitesNum.mas_bottom).offset(padding);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
   
//导游姓名
    guideName = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:height width:KScreenWidth-30 title:@"导游姓名"];
    [guideName hideUnderLine];
    [container addSubview:guideName];
    guideName.textColor = color(grayColor);
    guideName.text = @"涵邦";
    guideName.font = FONT(15);
    [guideName setEnabled:NO];
    [guideName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab2.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //电话
    guidePhone = [UILabel new];
    [container addSubview:guidePhone];
    guidePhone.textColor = color(blackColor);
    guidePhone.text = @"123456789";
    guidePhone.font = FONT(15);
    [guidePhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(guideName.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    //位置信息
    guideGps = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:height width:KScreenWidth-30 title:@"位置信息"];
    [guideGps hideUnderLine];
    [container addSubview:guideGps];
    guideGps.textColor = color(grayColor);
    guideGps.text = @"涵邦";
    guideGps.font = FONT(15);
    [guideGps setEnabled:NO];
    [guideGps mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(guidePhone.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    
    //线路导游信息
    UILabel *lab3 = [UILabel new];
    [container addSubview:lab3];
    lab3.text = @"     线路信息";
    lab3.font = FONT(15);
    lab3.textColor = color(grayColor);
    lab3.backgroundColor = color(groupTableViewBackgroundColor);
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(guideGps.mas_bottom).offset(padding);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    //线路信息
    routeInfo = [UILabel new];
    [container addSubview:routeInfo];
    routeInfo.textColor = color(blackColor);
    routeInfo.text = @"线路信息123456789线路信息123456789线路信息123456789线路信息123456789线路信息123456789线路信息123456789线路信息123456789线路信息123456789";
    routeInfo.font = FONT(15);
    [routeInfo sizeToFit];
    routeInfo.numberOfLines = 0;
    routeInfo.lineBreakMode = NSLineBreakByWordWrapping;
    [routeInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab3.mas_bottom).offset(padding+5);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(routeInfo.mas_bottom).offset(20);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
