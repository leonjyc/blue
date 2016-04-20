//
//  CarDemandViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/16.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "CarDemandViewController.h"

@interface CarDemandViewController ()<UIGestureRecognizerDelegate>
{
    UIScrollView *MainscrollView;
    UILabel *titleText;//标题
    LeftTitleTextField *contactNameText;//联系人
    LeftTitleTextField *phoneText;//手机号
    LeftTitleTextField *carType;////车型
    LeftTitleTextField *needSeatsNumText;//所需座位
    LeftTitleTextField *passengerText;//乘车人数
    
    LeftTitleTextField *startTimeText;//开始时间
    LeftTitleTextField *toTimeText;//结束时间
    
    UILabel *startAddress;//起始地
    UILabel *toAddress;//目的地
    
    UILabel *notesText;//备注
}
@end

@implementation CarDemandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用车需求";
    self.view.backgroundColor = color(whiteColor);
    [self setUI];
    [self addRightItem];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    //*************方法二*****************//
    //    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    //    edgePanGestureRecognizer.delegate = self;
    //    edgePanGestureRecognizer.edges = UIRectEdgeLeft;
    //    [self.view addGestureRecognizer:edgePanGestureRecognizer];
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
- (void)addRightItem{
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(changeAction)];
    self.navigationItem.rightBarButtonItem = rightBar;
}
//提交
- (void)changeAction{
    
}
- (void)setUI{
    WS(ws);
    float padding = 5;
    float height = 30;
    UIColor *textColor = color(blackColor);
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
    titleText.text = @"需求标题";
    [container addSubview:titleText];
    [titleText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    //联系人
    contactNameText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"联系人"];
    [contactNameText hideUnderLine];
    [container addSubview:contactNameText];
    [contactNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    [contactNameText setEnabled:NO];
    contactNameText.text = @"111333";
    //手机号
    phoneText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"手机号"];
    [phoneText hideUnderLine];
    [container addSubview:phoneText];
    [phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contactNameText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    [phoneText setEnabled:NO];
    phoneText.text = @"111333";
    phoneText.keyboardType = UIKeyboardTypeNumberPad;
    //    车型
    carType = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"车型"];
    [carType hideUnderLine];
    [container addSubview:carType];
    [carType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    [carType setEnabled:NO];
    carType.text = @"111333";
    //    所需座位
    needSeatsNumText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"所需座位"];
    [needSeatsNumText hideUnderLine];
    [container addSubview:needSeatsNumText];
    [needSeatsNumText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(carType.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    [needSeatsNumText setEnabled:NO];
    needSeatsNumText.text = @"111333";
    needSeatsNumText.keyboardType = UIKeyboardTypeNumberPad;
    //    乘车人数
    passengerText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"乘车人数"];
    [passengerText hideUnderLine];
    [container addSubview:passengerText];
    [passengerText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(needSeatsNumText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    [passengerText setEnabled:NO];
    passengerText.text = @"111333";
    passengerText.keyboardType = UIKeyboardTypeNumberPad;
    //分割
    UIView *bg1 = [UIView new];
    bg1.backgroundColor = color(groupTableViewBackgroundColor);
    [container addSubview:bg1];
    [bg1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passengerText.mas_bottom).offset(-1);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
    
    
    //开始时间
    startTimeText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"开始时间"];
    [startTimeText hideUnderLine];
    [container addSubview:startTimeText];
    [startTimeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg1.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    [startTimeText setEnabled:NO];
    startTimeText.text = @"111333";
    //结束时间
    toTimeText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:KScreenWidth-30 title:@"结束时间"];
    [toTimeText hideUnderLine];
    [container addSubview:toTimeText];
    [toTimeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startTimeText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(height);
    }];
    [toTimeText setEnabled:NO];
    toTimeText.text = @"111333";
    //分割
    UIView *bg2 = [UIView new];
    bg2.backgroundColor = color(groupTableViewBackgroundColor);
    [container addSubview:bg2];
    [bg2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(toTimeText.mas_bottom).offset(-1);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
    
    UILabel *label1 = [[UILabel alloc] init];
    [container addSubview:label1];
    label1.font = FONT(15);
    label1.text = @"起始地";
    label1.textColor = textColor;
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg2.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(height);
    }];
    
//    起始地
    startAddress = [[UILabel alloc] init];
    [container addSubview:startAddress];
    startAddress.numberOfLines = 0;
    startAddress.font = FONT(15);
    startAddress.textColor = textColor;
    startAddress.lineBreakMode = NSLineBreakByWordWrapping;
    [startAddress sizeToFit];
    [startAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg2.mas_bottom).offset(padding+5);
        make.left.mas_equalTo(15+70);
        make.right.mas_equalTo(-15);
    }];
    startAddress.text = @"起始地起始地起始地起始地起始地起始地起始地起始地起始地起始地起始地起始地111333";
    
    UILabel *label2 = [[UILabel alloc] init];
    [container addSubview:label2];
    label2.font = FONT(15);
    label2.text = @"目的地";
    label2.textColor = textColor;
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startAddress.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(height);
    }];
    //目的地
    toAddress = [[UILabel alloc] init];
    [container addSubview:toAddress];
    toAddress.numberOfLines = 0;
    toAddress.textColor = textColor;
    toAddress.font = FONT(15);
    toAddress.lineBreakMode = NSLineBreakByWordWrapping;
    [toAddress sizeToFit];
    [toAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startAddress.mas_bottom).offset(padding+5);
        make.left.mas_equalTo(15+70);
        make.right.mas_equalTo(-15);
    }];
    toAddress.text = @"目的地目的地目的地目的地目的地111333";
    
    //分割
    UIView *bg3 = [UIView new];
    bg3.backgroundColor = color(groupTableViewBackgroundColor);
    [container addSubview:bg3];
    [bg3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(toAddress.mas_bottom).offset(padding);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    [container addSubview:label];
    label.font = FONT(15);
    label.text = @"备注";
    label.textColor = textColor;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg3.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(height);
    }];
    //备注
    notesText = [[UILabel alloc] init];
    notesText.text = @"备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注";
    notesText.numberOfLines = 0;
    notesText.font = FONT(15);
    notesText.lineBreakMode = NSLineBreakByWordWrapping;
    [notesText sizeToFit];
    [container addSubview:notesText];
    [notesText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg3.mas_bottom).offset(padding+5);
        make.left.equalTo(label.mas_right);
        make.right.mas_equalTo(-15);
//        make.height.mas_equalTo(height);
    }];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(notesText.mas_bottom).offset(20);
    }];
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
