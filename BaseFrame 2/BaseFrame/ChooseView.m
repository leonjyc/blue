//
//  ChooseView.m
//  BaseFrame
//
//  Created by yons on 16/4/19.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "ChooseView.h"
@interface ChooseView()
{
    UIDatePicker *datePicker;
}
@end
@implementation ChooseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)fra Title:(NSString *)tit Button:(UIButton *)button lastDate:(NSString *)date TimeOrDate:(NSString *)TimeOrDate{
    self = [super init];
    if (self) {
        self.title = tit;
        self.Button = button;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithHexString:@"#1c1c1c" alpha:0.4];
        //        self.alpha = 0.4;
        //提示框
        self.alertView = [[UIView alloc] init];
//        self.alertView.layer.masksToBounds = YES;
        self.alertView.backgroundColor = color(whiteColor);
        self.alertView.layer.cornerRadius = 5;
        self.alertView.frame = fra;
        self.alertView.layer.shadowColor = [UIColor colorWithHexString:@"#131212" alpha:0.8].CGColor;//#131212
        self.alertView.layer.shadowOffset = CGSizeMake(2,2);
        self.alertView.layer.shadowOpacity = 1;
        self.alertView.layer.shadowRadius = 5;
        [self addSubview:self.alertView];
        //标题
        UILabel *title = [[UILabel alloc] init];
//        title.layer.cornerRadius = 5;
//        title.layer.masksToBounds = YES;
        title.frame = CGRectMake(0, 0, widths(self.alertView), 40);
        title.font = FONT(16);
        [self.alertView addSubview:title];
        title.text = tit;
        title.textColor = color(whiteColor);
        title.backgroundColor = backColor;
        title.textAlignment = NSTextAlignmentCenter;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:title.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = title.bounds;
        maskLayer.path = maskPath.CGPath;
        title.layer.mask  = maskLayer;
        
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 25, fra.size.width, fra.size.height-10)];
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        datePicker.locale = locale;
        self.timeOrDate = TimeOrDate;
        if ([TimeOrDate isEqualToString:@"date"]) {
            datePicker.datePickerMode = UIDatePickerModeDate;
        }
        else{
            datePicker.datePickerMode = UIDatePickerModeTime;
        }
        NSDate *now;
        if (date.length > 0) {
            now = [self dateFromString:date];
        }
        else {
           now  = [NSDate date];
        }
//        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        NSDateComponents *offet = [[NSDateComponents alloc] init];
//        [offet setYear:0];
//        [offet setMonth:0];
//        [offet setDay:14];
//        [offet setHour:0];
//        [offet setMonth:0];
//        [offet setSecond:0];
//        NSDate *maxDate = [gregorian dateByAddingComponents:offet toDate:now options:0];
        datePicker.minimumDate = now;
        [self.alertView addSubview:datePicker];
        
        UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 40, 40)];
        
        [back setTitle:@"取消" forState:UIControlStateNormal];
        
        back.titleLabel.font = FONT(15);
        [back setTitleColor:color(whiteColor) forState:UIControlStateNormal];
        [self.alertView addSubview:back];
        [back addTarget:self action:@selector(cancleAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *ok = [[UIButton alloc] initWithFrame:CGRectMake(fra.size.width-45, 0, 40, 40)];
        
        [ok setTitle:@"确认" forState:UIControlStateNormal];
        
        ok.titleLabel.font = FONT(15);
        [ok setTitleColor:color(whiteColor) forState:UIControlStateNormal];
        [self.alertView addSubview:ok];
        [ok addTarget:self action:@selector(okAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}
- (NSDate *)dateFromString:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if ([self.timeOrDate isEqualToString:@"date"]) {
        [dateFormatter setDateFormat: @"YYYY-MM-dd"];
    }
    else{
        [dateFormatter setDateFormat: @"HH:mm"];
    }
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
    
}
- (void)cancleAction:(UIButton *)Btn{
    [self hide];
}
- (void)okAction:(UIButton *)Btn{
    if (self.block) {
        NSDate *date = datePicker.date;
        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
        if ([self.timeOrDate isEqualToString:@"date"]) {
            [dateformatter setDateFormat: @"YYYY-MM-dd"];
        }
        else{
            [dateformatter setDateFormat: @"HH:mm"];
        }
        NSString *locationString=[dateformatter stringFromDate:date];
        self.block(self,self.Button,locationString);
    }
}

- (void)show{
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = [win.subviews firstObject];
    [topView addSubview:self];
    
}
- (void)hide{
    [self removeFromSuperview];
}

@end
