//
//  BlockBtn.h
//  chezhu
//
//  Created by yons on 15/12/9.
//  Copyright (c) 2015年 xiaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonBlock)(UIButton *);
@interface BlockBtn : UIButton
@property(nonatomic,copy)ButtonBlock block;
- (void)addTapBlock:(ButtonBlock)block;
@end
