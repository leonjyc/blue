//
//  DiscountListTableViewCell.m
//  BaseFrame
//
//  Created by yons on 16/4/15.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "DiscountListTableViewCell.h"

@interface DiscountListTableViewCell()
@property (nonatomic, strong) UILabel *statusLab;
@property (nonatomic, strong) UILabel *CarStatusLab;
@property (nonatomic, strong) UILabel *fromCity;
@property (nonatomic, strong) UILabel *toCity;
@property (nonatomic, strong) UILabel *fromTime;
@property (nonatomic, strong) UILabel *toTime;
@property (nonatomic, strong) UILabel *notes;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *telphone;
@end

@implementation DiscountListTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = color(whiteColor);
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        self.statusLab = [[UILabel alloc] init];
        self.statusLab.font = FONT(15);
        [self.contentView addSubview:self.statusLab];
        self.CarStatusLab = [[UILabel alloc] init];
        [self.contentView addSubview:self.CarStatusLab];
        
        self.statusLab.textColor = gColor;
        self.statusLab.textAlignment = NSTextAlignmentCenter;
        self.statusLab.text = @"[不可套]";
        [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(self.CarStatusLab.mas_height);
            make.bottom.equalTo(self.CarStatusLab.mas_top);
        }];
        self.statusLab.preferredMaxLayoutWidth = 60;
        
        
        self.CarStatusLab.textColor = gColor;
        self.CarStatusLab.textAlignment = NSTextAlignmentCenter;
        self.CarStatusLab.font = FONT(15);
        self.CarStatusLab.text = @"[空车]";
        [self.CarStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.statusLab.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(self.statusLab.mas_height);
            make.bottom.mas_equalTo(0);
        }];
        self.statusLab.preferredMaxLayoutWidth = 60;
        
        UIView *shuxian = [[UIView alloc] init];
        shuxian.backgroundColor = gColor;
        [self.contentView addSubview:shuxian];
        [shuxian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(2);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.left.equalTo(self.statusLab.mas_right).offset(0);
        }];
        
        UIView *content = [[UIView alloc] init];
        [self.contentView addSubview:content];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(shuxian.mas_right);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
//            make.bottom.mas_equalTo(0);
        }];
        
        UIView *hengxian = [[UIView alloc] init];
        [content addSubview:hengxian];
        hengxian.backgroundColor = gColor;
        [hengxian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(75);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(40);
            make.centerX.mas_equalTo(content.mas_centerX);
        }];
        
        UILabel *lab = [[UILabel alloc] init];
        [content addSubview:lab];
        lab.text = @">";
        lab.textColor = gColor;
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hengxian.mas_right).offset(-2);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(20);
            make.centerY.mas_equalTo(hengxian.mas_centerY).offset(-2);
        }];
        
        self.fromTime = [[UILabel alloc] init];
        [content addSubview:self.fromTime];
        self.fromTime.textAlignment = NSTextAlignmentCenter;
        self.fromTime.text = @"04-12 00:00";
        self.fromTime.font = FONT(14);
        [self.fromTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
            make.bottom.equalTo(hengxian.mas_top);
            make.centerX.mas_equalTo(content.mas_centerX);
        }];
        self.fromTime.preferredMaxLayoutWidth = 100;
        self.toTime = [[UILabel alloc] init];
        [content addSubview:self.toTime];
        self.toTime.textAlignment = NSTextAlignmentCenter;
        self.toTime.text = @"04-12 00:00";
        self.toTime.font = FONT(14);
        [self.toTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
            make.top.equalTo(hengxian.mas_bottom);
            make.centerX.mas_equalTo(content.mas_centerX);
        }];
        self.toTime.preferredMaxLayoutWidth = 100;
        
        self.fromCity = [[UILabel alloc] init];
        [content addSubview:self.fromCity];
        self.fromCity.textAlignment = NSTextAlignmentRight;
        self.fromCity.text = @"北京";
        self.fromCity.font = FONT(14);
        [self.fromCity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.equalTo(hengxian.mas_left).offset(-2);
            make.height.mas_equalTo(20);
            make.centerY.mas_equalTo(hengxian.mas_centerY);
        }];
        self.fromCity.preferredMaxLayoutWidth = w-30;
        
        self.toCity = [[UILabel alloc] init];
        [content addSubview:self.toCity];
        self.toCity.textAlignment = NSTextAlignmentLeft;
        self.toCity.text = @"北京";
        self.toCity.font = FONT(14);
        [self.toCity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.left.equalTo(hengxian.mas_right).offset(10);
            make.height.mas_equalTo(20);
            make.centerY.mas_equalTo(hengxian.mas_centerY);
        }];
        self.toCity.preferredMaxLayoutWidth = w-30;
        
        self.notes = [UILabel new];
        [content addSubview:self.notes];
        self.notes.text = @"是大大大的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶大是大大大的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶大是大大大的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶大";
        self.notes.font = FONT(15);
        self.notes.numberOfLines = 0;
        [self.notes sizeToFit];
        [self.notes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.toTime.mas_bottom).offset(10);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
        }];
        self.notes.preferredMaxLayoutWidth = w-60;
        
        self.name = [UILabel new];
        [content addSubview:self.name];
        
        self.telphone = [UILabel new];
        [content addSubview:self.telphone];
        
        self.name.text = @"是大大";
        self.name.font = FONT(15);
        self.name.textAlignment = NSTextAlignmentLeft;
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.notes.mas_bottom).offset(10);
            make.left.mas_equalTo(5);
            make.right.equalTo(self.telphone.mas_left);
            make.height.mas_equalTo(20);
        }];
        self.name.preferredMaxLayoutWidth = w-60-120;
        
        self.telphone.text = @"13800000000";
        self.telphone.font = FONT(15);
        self.telphone.textAlignment = NSTextAlignmentRight;
        [self.telphone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.notes.mas_bottom).offset(10);
            make.width.mas_equalTo(120);
            make.right.mas_equalTo(-5);
            make.height.mas_equalTo(20);
        }];
        self.telphone.preferredMaxLayoutWidth = 120;
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.name.mas_bottom);
        }];
        self.hyb_lastViewInCell = content;
        self.hyb_bottomOffsetToCell = 10;//离底部
    }
    
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
