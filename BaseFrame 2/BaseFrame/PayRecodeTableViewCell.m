//
//  PayRecodeTableViewCell.m
//  BaseFrame
//
//  Created by yons on 16/4/16.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "PayRecodeTableViewCell.h"

@implementation PayRecodeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = color(groupTableViewBackgroundColor);
        CGFloat w = [UIScreen mainScreen].bounds.size.width-30;
        UIColor *textColor = color(grayColor);
        float padding = 5;
        float height = 20;
        UIView *content = [[UIView alloc] init];
        [self.contentView addSubview:content];
        content.backgroundColor = color(whiteColor);
        content.layer.cornerRadius = 5;
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-15);
        }];
        //标题
        self.title = [[UILabel alloc] init];
        self.title.font = FONT(15);
        self.title.text = @"支出";
        [content addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo(20);
        }];
        self.title.preferredMaxLayoutWidth = w - 30;
        
        //金额
        self.moneyText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:w-30 title:@"金额"];
        [self.moneyText hideUnderLine];
        [self.moneyText setEnabled:NO];
        self.moneyText.textColor = textColor;
        [content addSubview:self.moneyText];
        self.moneyText.text = @"500";
        [self.moneyText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).offset(padding);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(15);
            make.height.mas_equalTo(height);
        }];
        
        //时间
        self.timeText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:w-30 title:@"时间"];
        [self.timeText hideUnderLine];
        [self.timeText setEnabled:NO];
        self.timeText.textColor = textColor;
        [content addSubview:self.timeText];
        self.timeText.text = @"500";
        [self.timeText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.moneyText.mas_bottom).offset(padding);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(15);
            make.height.mas_equalTo(height);
        }];
        
        //订单号
        self.orderNumText = [[LeftTitleTextField alloc] initWithUnderLineColor:textColor height:height width:w-30 title:@"订单号"];
        [self.orderNumText hideUnderLine];
        [self.orderNumText setEnabled:NO];
        self.orderNumText.textColor = textColor;
        [content addSubview:self.orderNumText];
        self.orderNumText.text = @"500";
        [self.orderNumText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeText.mas_bottom).offset(padding);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(15);
            make.height.mas_equalTo(height);
        }];
        
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.orderNumText.mas_bottom).offset(20);
        }];
        self.hyb_lastViewInCell = content;
        self.hyb_bottomOffsetToCell = 0;
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
