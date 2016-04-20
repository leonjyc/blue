//
//  OrderListTableViewCell.m
//  BaseFrame
//
//  Created by yons on 16/4/14.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import "OrderListTableViewCell.h"
@interface OrderListTableViewCell ()

@property (nonatomic, strong) UILabel *addressLab;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *orderNumLab;
@property (nonatomic, strong) UILabel *note1;
@property (nonatomic, strong) UILabel *note2;
@end

@implementation OrderListTableViewCell



- (void)awakeFromNib {
    // Initialization code
}
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = color(groupTableViewBackgroundColor);
        CGFloat w = [UIScreen mainScreen].bounds.size.width-30;
        UIView *content = [[UIView alloc] init];
        [self.contentView addSubview:content];
        content.backgroundColor = color(whiteColor);
        content.layer.cornerRadius = 5;
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-15);
        }];
        
        self.addressLab = [[UILabel alloc] init];
        [content addSubview:self.addressLab];
        self.addressLab.numberOfLines = 0;
        self.addressLab.font = FONT(16);
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(-15);
//            make.height.mas_lessThanOrEqualTo(80);
        }];
        // 应该始终要加上这一句
        // 不然在6/6plus上就不准确了
        self.addressLab.preferredMaxLayoutWidth = w - 30;
        
        self.timeLabel = [[UILabel alloc] init];
        [content addSubview:self.timeLabel];
        self.timeLabel.font = FONT(15);
        self.timeLabel.textColor = color(grayColor);
        self.timeLabel.numberOfLines = 0;
        [self.timeLabel sizeToFit];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(self.addressLab.mas_bottom).offset(15);
        }];
        self.timeLabel.preferredMaxLayoutWidth = w - 30;
        
        self.orderNumLab = [[UILabel alloc] init];
        [content addSubview:self.orderNumLab];
        self.orderNumLab.font = FONT(15);
        self.orderNumLab.textColor = color(grayColor);
        self.orderNumLab.numberOfLines = 0;
        [self.orderNumLab sizeToFit];
        [self.orderNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(15);
        }];
        self.orderNumLab.preferredMaxLayoutWidth = w - 30;
        
        UILabel *liuyan1 = [[UILabel alloc] init];
        [content addSubview:liuyan1];
        liuyan1.text = @"导游留言";
        liuyan1.font = FONT(15);
        liuyan1.textColor = color(grayColor);
        [liuyan1 sizeToFit];
        [liuyan1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(self.orderNumLab.mas_bottom).offset(15);
        }];
        liuyan1.preferredMaxLayoutWidth = w - 30;
        
        
        self.note1 = [[UILabel alloc] init];
        [content addSubview:self.note1];
        self.note1.font = FONT(15);
        self.note1.backgroundColor = hexColor(@"#f05017");
        self.note1.textColor = color(whiteColor);
        self.note1.layer.cornerRadius = 2;
        self.note1.layer.masksToBounds = YES;
        self.note1.textAlignment = NSTextAlignmentCenter;
        [self.note1 sizeToFit];
        [self.note1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(liuyan1.mas_right).offset(5);
            make.top.mas_equalTo(self.orderNumLab.mas_bottom).offset(15);
        }];
        self.note1.preferredMaxLayoutWidth = w - 30;
        
        UILabel *liuyan2 = [[UILabel alloc] init];
        [content addSubview:liuyan2];
        liuyan2.text = @"旅行社留言";
        liuyan2.font = FONT(15);
        liuyan2.textColor = color(grayColor);
        [liuyan2 sizeToFit];
        [liuyan2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.note1.mas_right).offset(10);
            make.top.mas_equalTo(self.orderNumLab.mas_bottom).offset(15);
        }];
        liuyan2.preferredMaxLayoutWidth = w - 30;
        
        
        self.note2 = [[UILabel alloc] init];
        [content addSubview:self.note2];
        self.note2.font = FONT(15);
        self.note2.backgroundColor = hexColor(@"#f05017");
        self.note2.textColor = color(whiteColor);
        self.note2.layer.cornerRadius = 2;
        self.note2.textAlignment = NSTextAlignmentCenter;
        self.note2.layer.masksToBounds = YES;
        [self.note2 sizeToFit];
        [self.note2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(liuyan2.mas_right).offset(5);
            make.top.mas_equalTo(self.orderNumLab.mas_bottom).offset(15);
        }];
        self.note2.preferredMaxLayoutWidth = w - 30;
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.note2.mas_bottom).offset(20);
        }];
        self.hyb_lastViewInCell = content;
        self.hyb_bottomOffsetToCell = 0;//离底部
    }
    
    return self;
}
- (void)configCellWithModel:(OrderListModel *)model {
    self.addressLab.text = model.address;
    self.timeLabel.text = model.time;
    self.orderNumLab.text = model.orderNo;
    self.note1.text = model.note1;
    self.note2.text = model.note2;
    CGSize sizeThatFit = [self.note1 sizeThatFits:CGSizeZero];
    [self.note1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(sizeThatFit.width+8);
    }];
    CGSize sizeThatFit2 = [self.note2 sizeThatFits:CGSizeZero];
    [self.note2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(sizeThatFit2.width+8);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
