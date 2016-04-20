//
//  PayRecodeTableViewCell.h
//  BaseFrame
//
//  Created by yons on 16/4/16.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayRecodeTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) LeftTitleTextField *moneyText;
@property (nonatomic, strong) LeftTitleTextField *timeText;
@property (nonatomic, strong) LeftTitleTextField *orderNumText;
@end
