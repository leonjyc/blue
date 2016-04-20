//
//  OrderListTableViewCell.h
//  BaseFrame
//
//  Created by yons on 16/4/14.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"
typedef void(^HYBExpandBlock)(BOOL isExpand);
@interface OrderListTableViewCell : UITableViewCell
@property (nonatomic, copy) HYBExpandBlock expandBlock;
- (void)configCellWithModel:(OrderListModel *)model;
@end
