//
//  OrderListModel.h
//  BaseFrame
//
//  Created by yons on 16/4/14.
//  Copyright © 2016年 xiaojiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderListModel : NSObject
@property int uid;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *orderNo;
@property (nonatomic, copy) NSString *note1;
@property (nonatomic, copy) NSString *note2;
@end
