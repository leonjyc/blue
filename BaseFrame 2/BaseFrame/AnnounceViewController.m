//
//  AnnounceViewController.m
//  BaseFrame
//
//  Created by yons on 16/4/15.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "AnnounceViewController.h"

@interface AnnounceViewController ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    UIScrollView *MainscrollView;
    LeftTitleTextField *titleText;//标题
    LeftTitleTextField *contactNameText;//联系人
    LeftTitleTextField *phoneText;//手机号
    LeftTitleTextField *carType;////车型
    LeftTitleTextField *needSeatsNumText;//所需座位
    LeftTitleTextField *passengerText;//乘车人数
    
    LeftView *startDateText;//开始日期
    LeftView *startTimeText;//开始时间
    LeftView *toDateText;//结束日期
    LeftView *toTimeText;//结束时间
    
    UIButton *startShen;//开始省份
    UIButton *startCity;//开始城市
    UIButton *startState;//开始区
    UIButton *startAirPort;//机场
    
    UIButton *endShen;//结束省份
    UIButton *endCity;//结束城市
    UIButton *endState;//结束区
    UIButton *endAirPort;//结束机场
    
    UITextView *notesView;//备注
}
@end

@implementation AnnounceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布";
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
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitAction)];
    self.navigationItem.rightBarButtonItem = rightBar;
}
//提交
- (void)submitAction{
    
}
- (void)setUI{
    float padding = 10;
    WS(ws);
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
    titleText = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"标题"];
    [container addSubview:titleText];
    [titleText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    //联系人
    contactNameText = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"联系人"];
    [container addSubview:contactNameText];
    [contactNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    //手机号
    phoneText = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"手机号"];
    [container addSubview:phoneText];
    [phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contactNameText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    phoneText.keyboardType = UIKeyboardTypeNumberPad;
    phoneText.delegate = self;
//    车型
    carType = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"车型"];
    [container addSubview:carType];
    [carType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
//    所需座位
    needSeatsNumText = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"所需座位"];
    [container addSubview:needSeatsNumText];
    [needSeatsNumText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(carType.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    needSeatsNumText.keyboardType = UIKeyboardTypeNumberPad;
//    乘车人数
    passengerText = [[LeftTitleTextField alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"乘车人数"];
    [container addSubview:passengerText];
    [passengerText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(needSeatsNumText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
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
    
    //开始日期
    startDateText = [[LeftView alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"开始日期"];
    [container addSubview:startDateText];
    [startDateText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg1.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
//    startDateText.delegate = self;

    startDateText.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseData:)];
    [startDateText addGestureRecognizer:tap];
    
    
    //结束日期
    toDateText = [[LeftView alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"结束日期"];
    [container addSubview:toDateText];
    [toDateText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startDateText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    
    toDateText.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseData:)];
    [toDateText addGestureRecognizer:tap1];
    
    //开始时间
    startTimeText = [[LeftView alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"开始时间"];
    [container addSubview:startTimeText];
    [startTimeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(toDateText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    startTimeText.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseData:)];
    [startTimeText addGestureRecognizer:tap2];
    //结束时间
    toTimeText = [[LeftView alloc] initWithUnderLineColor:color(grayColor) height:40 width:KScreenWidth-30 title:@"结束时间"];
    [container addSubview:toTimeText];
    [toTimeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startTimeText.mas_bottom).offset(padding);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    toTimeText.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseData:)];
    [toTimeText addGestureRecognizer:tap3];
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
    
    //城市选择
    startShen = [UIButton new];
    [container addSubview:startShen];
    startShen.titleLabel.font = FONT(15);
    [startShen setTitle:@"起始地省" forState:UIControlStateNormal];
    [startShen setTitleColor:color(grayColor) forState:UIControlStateNormal];
    
    startCity = [UIButton new];
    [container addSubview:startCity];
    startCity.titleLabel.font = FONT(15);
    [startCity setTitle:@"市" forState:UIControlStateNormal];
    [startCity setTitleColor:color(grayColor) forState:UIControlStateNormal];
    
    startState = [UIButton new];
    [container addSubview:startState];
    startState.titleLabel.font = FONT(15);
    [startState setTitle:@"区" forState:UIControlStateNormal];
    [startState setTitleColor:color(grayColor) forState:UIControlStateNormal];
    
    [startShen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(bg2.mas_bottom).offset(padding);
        make.right.equalTo(startCity.mas_left);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(startCity.mas_width);
    }];
    startShen.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    startShen.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [startCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(startShen.mas_right);
        make.top.equalTo(bg2.mas_bottom).offset(padding);
        make.right.equalTo(startState.mas_left);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(startState.mas_width);
    }];
//    startCity.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    startCity.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [startState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(startCity.mas_right);
        make.top.equalTo(bg2.mas_bottom).offset(padding);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(startShen.mas_width);
    }];
//    startState.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    startState.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    
    //两条竖分割
    UIView *shuxian1 = [[UIView alloc] init];
    [container addSubview:shuxian1];
    shuxian1.backgroundColor = color(groupTableViewBackgroundColor);
    [shuxian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(startShen.mas_right);
        make.top.equalTo(bg2.mas_bottom).offset(padding+5);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(30);
    }];
    
    UIView *shuxian2 = [[UIView alloc] init];
    [container addSubview:shuxian2];
    shuxian2.backgroundColor = color(groupTableViewBackgroundColor);
    [shuxian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(startCity.mas_right);
        make.top.equalTo(bg2.mas_bottom).offset(padding+5);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(30);
    }];
    
    UIView *fenge = [UIView new];
    fenge.backgroundColor = color(groupTableViewBackgroundColor);
    [container addSubview:fenge];
    [fenge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startShen.mas_bottom);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(1);
    }];
    
    //开始机场
    startAirPort = [UIButton new];
    [container addSubview:startAirPort];
    startAirPort.titleLabel.font = FONT(15);
    [startAirPort setTitle:@"机场" forState:UIControlStateNormal];
    [startAirPort setTitleColor:color(grayColor) forState:UIControlStateNormal];
    startAirPort.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [startAirPort mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(fenge.mas_bottom).offset(padding);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    startAirPort.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIView *fenge2 = [UIView new];
    fenge2.backgroundColor = color(groupTableViewBackgroundColor);
    [container addSubview:fenge2];
    [fenge2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(startAirPort.mas_bottom);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(1);
    }];
    
    
    endShen = [UIButton new];
    [container addSubview:endShen];
    endShen.titleLabel.font = FONT(15);
    [endShen setTitle:@"目的地省" forState:UIControlStateNormal];
    [endShen setTitleColor:color(grayColor) forState:UIControlStateNormal];
    
    endCity = [UIButton new];
    [container addSubview:endCity];
    endCity.titleLabel.font = FONT(15);
    [endCity setTitle:@"市" forState:UIControlStateNormal];
    [endCity setTitleColor:color(grayColor) forState:UIControlStateNormal];
    
    endState = [UIButton new];
    [container addSubview:endState];
    endState.titleLabel.font = FONT(15);
    [endState setTitle:@"区" forState:UIControlStateNormal];
    [endState setTitleColor:color(grayColor) forState:UIControlStateNormal];
    
    [endShen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(fenge2.mas_bottom).offset(padding);
        make.right.equalTo(endCity.mas_left);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(endCity.mas_width);
    }];
    endShen.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    startShen.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [endCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(endShen.mas_right);
        make.top.equalTo(fenge2.mas_bottom).offset(padding);
        make.right.equalTo(endState.mas_left);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(endState.mas_width);
    }];
    //    startCity.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    endCity.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [endState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(endCity.mas_right);
        make.top.equalTo(fenge2.mas_bottom).offset(padding);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(endShen.mas_width);
    }];
    //    startState.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    endState.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    
    //两条竖分割
    UIView *shuxian3 = [[UIView alloc] init];
    [container addSubview:shuxian3];
    shuxian3.backgroundColor = color(groupTableViewBackgroundColor);
    [shuxian3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(endShen.mas_right);
        make.top.equalTo(fenge2.mas_bottom).offset(padding+5);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(30);
    }];
    
    UIView *shuxian4 = [[UIView alloc] init];
    [container addSubview:shuxian4];
    shuxian4.backgroundColor = color(groupTableViewBackgroundColor);
    [shuxian4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(endCity.mas_right);
        make.top.equalTo(fenge2.mas_bottom).offset(padding+5);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(30);
    }];
    
    UIView *fenge1 = [UIView new];
    fenge1.backgroundColor = color(groupTableViewBackgroundColor);
    [container addSubview:fenge1];
    [fenge1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(endShen.mas_bottom);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(1);
    }];
    
    //开始机场
    endAirPort = [UIButton new];
    [container addSubview:endAirPort];
    endAirPort.titleLabel.font = FONT(15);
    [endAirPort setTitle:@"机场" forState:UIControlStateNormal];
    [endAirPort setTitleColor:color(grayColor) forState:UIControlStateNormal];
    endAirPort.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [endAirPort mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(fenge1.mas_bottom).offset(padding);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    endAirPort.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //分割
    UIView *bg3 = [UIView new];
    bg3.backgroundColor = color(groupTableViewBackgroundColor);
    [container addSubview:bg3];
    [bg3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(endAirPort.mas_bottom).offset(-1);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
    
    UILabel *note = [UILabel new];
    [container addSubview:note];
    note.font = FONT(15);
    note.textColor = color(grayColor);
    note.text = @"备注";
    [note mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(bg3.mas_bottom).offset(padding);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(50);
    }];
    
    notesView = [UITextView new];
    [container addSubview:notesView];
//    notesView.backgroundColor = RandomColor;
    [notesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(note.mas_top).offset(3);
        make.left.equalTo(note.mas_right);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(80);
    }];
    notesView.font = FONT(15);
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(notesView.mas_bottom).offset(20);
    }];
}

- (void)chooseData:(UITapGestureRecognizer *)tap{
    LeftView *left = (LeftView *)tap.view;
    NSString *date = @"";
    if (left == toDateText) {
        if (startDateText.rightLab.text.length > 0) {
            date = startDateText.rightLab.text;
        }
    }
    NSString *timeOrDate = @"date";
    if (left == startDateText || left == toDateText) {
        timeOrDate = @"date";
    }
    else{
        timeOrDate = @"time";
    }
    ChooseView *choose = [[ChooseView alloc] initWithFrame:CGRectMake(15, KScreenHeight/2-120, KScreenWidth-30, 240) Title:@"选择日期" Button:nil lastDate:date TimeOrDate:timeOrDate];
    [choose show];
    __weak typeof(ChooseView) *c = choose;
    choose.block = ^(ChooseView *view,UIButton *btn, NSString *string){
        left.rightLab.text = string;
        [c hide];
    };
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == phoneText) {
        if (range.location >= 11) return NO;
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
